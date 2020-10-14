class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar_image
  belongs_to :user
end
