class CommentReplyMailer < ApplicationMailer
    def send_reply(user, item)
      @user = user
      @item = item
      mail to: user.email, subject: 'コメントに返信がありました'
    end
end