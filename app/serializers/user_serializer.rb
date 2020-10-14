class UserSerializer < ActiveModel::Serializer
    attributes :id, :display_name, :avatar_image
    has_many :comments
    has_one :profile

end