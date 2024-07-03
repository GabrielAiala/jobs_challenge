class Submission < ApplicationRecord
  belongs_to :job

  validates :email, uniqueness: { scope: :job_id, message: "Já cadastrado para essa vaga" }
end
