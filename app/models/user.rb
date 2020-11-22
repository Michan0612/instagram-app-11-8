class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # before_create :default_image

  # def default_image
  #   profile.avatar_image_1.attach(io: File.open("#{Rails.root}/app/assets/images/Ellipse.png"), filename: "Ellipse.png", content_type: 'image/png')
  # end



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }

  has_one_attached :avatar

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower



  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def has_liked?(item)
    likes.exists?(item_id: item.id)
  end

  def prepare_profile
    profile || build_profile
  end

  def follow!(user)
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    user_id = get_user_id(user)
    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  private
  def get_user_id(user)
    if user.is_a?(User)
      user.id
    else
      user
    end
  end
end