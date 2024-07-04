require 'rails_helper'

RSpec.describe SubmissionsController, type: :request do
  describe 'POST #create' do
    let(:headers) { { "ACCEPT" => "application/json"} }
    let(:job) { create(:job) }
    let(:submission) { create(:submission, job: job) }

    let(:valid_params) do
      { submission: {
          email: "example@example.com",
          job_id: job.id,
		      resume: "resume",
		      mobile_phone: "5511555555555",
		      name: "bob",
        }
      }
    end

    let(:invalid_params) do
      { submission: {
          email: submission.email,
          job_id: job.id,
		      resume: "resume",
		      mobile_phone: "5511555555555",
		      name: "bob",
        }
      }
    end

    it 'creates a new job with an authenticaded recruiter' do
      post '/submissions', params: valid_params, headers: headers
      expect(response).to have_http_status(:created)
      expect(response.parsed_body['email']).to eq('example@example.com')
    end

    it 'returns email already exists' do
      post '/submissions', params: invalid_params, headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:conflict)
    end
  end
end
