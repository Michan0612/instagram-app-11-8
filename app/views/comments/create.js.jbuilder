json.array! @comment.each do | comment |
    json.name comment.user.id
end