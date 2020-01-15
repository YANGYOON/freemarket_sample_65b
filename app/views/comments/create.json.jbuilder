json.text  @comment.text
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.date @comment.created_at.strftime("%Y/%m/%d %H:%M")