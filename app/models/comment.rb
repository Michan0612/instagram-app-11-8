class Comment < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 140}}

    belongs_to :user
    belongs_to :item

    after_create :send_email

    private
    def send_email
        CommentReplyMailer.send_reply(user, item).deliver_now
    end
end
