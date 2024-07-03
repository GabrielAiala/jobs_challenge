json.status do
  json.code 422
  json.message "User couldn't be find. #{resource.errors.full_messages.to_sentence}"
end
