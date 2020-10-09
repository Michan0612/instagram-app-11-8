json.array! @comment.each do | comment |
    json.user_id comment.user.id
end