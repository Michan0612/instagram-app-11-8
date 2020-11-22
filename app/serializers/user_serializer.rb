class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :display_name, :avatar_with_image
    has_many :comments
    has_one :profile

    def avatar_with_image
        rails_blob_path(object.profile.avatar_image_1) if object.profile.avatar_image_1.attachment
    end
end
# 必要な記述なのでテストが終わったらコメントアウトを消しましょう