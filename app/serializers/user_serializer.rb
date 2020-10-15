class UserSerializer < ActiveModel::Serializer
    attributes :id, :display_name, :avatar_image
    has_many :comments
    has_one :profile

    def avatar_image
        rails_blob_path(object.avatar_image, only_path: true) if object.avatar_image.attached?
    end
end