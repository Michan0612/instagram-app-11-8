class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar_image_1
  belongs_to :user
end
