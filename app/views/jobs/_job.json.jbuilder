json.extract! job, :id, :title, :description, :start_date, :end_date, :status, :recruiter_id, :created_at, :updated_at
json.url job_url(job, format: :json)
