class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username,
             presence: true, 
             uniqueness: true,
             length: { minimum: 4, maximum: 20 }

  has_one :profile, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def has_liked?(item)
    likes.exists?(item_id: item.id)
  end
    
  def prepare_profile
    profile || build_profile
  end
  
end