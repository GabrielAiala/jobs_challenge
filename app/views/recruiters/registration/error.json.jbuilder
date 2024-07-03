json.status do
  json.code 422
  json.message "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"
end
