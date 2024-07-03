json.status do
  json.message "User couldn't be find. #{resource.errors.full_messages.to_sentence}"
end
