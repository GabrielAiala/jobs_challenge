json.status do
  json.message "Não foi possivel criar Recruiter. #{resource.errors.full_messages.to_sentence}"
end
