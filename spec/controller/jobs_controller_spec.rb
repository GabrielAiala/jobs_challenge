require 'rails_helper'

RSpec.describe JobsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/jobs', headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    !let(:job) { create(:job) }
    it 'returns a successful response' do
      get "/jobs/#{job.id}", headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:ok)
    end

    it 'returns an error when job is not found' do
      get '/jobs/999', headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    let(:recruiter) { create(:recruiter) }
    let(:headers) { { "ACCEPT" => "application/json"} }

    before do
      login_as(recruiter)
    end

    let(:valid_params) do
      { job: { title: 'Software Engineer', description: 'Develop and maintain web applications.' } }
    end

    it 'creates a new job with an authenticaded recruiter' do
      post '/jobs', params: valid_params, headers: headers
      expect(response).to have_http_status(:created)
      expect(response.parsed_body['title']).to eq('Software Engineer')
    end

    it 'returns unauthorized' do
      logout(:recruiter)
      post '/jobs', params: valid_params, headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
