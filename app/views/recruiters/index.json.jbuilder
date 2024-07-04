json.array! @recruiters do |recruiter|
  json.extract! recruiter, :id, :email
end
