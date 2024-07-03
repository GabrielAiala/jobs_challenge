json.status do
  json.code 200
  json.message "logged out successfully. #{resource.errors.full_messages.to_sentence}"
end
