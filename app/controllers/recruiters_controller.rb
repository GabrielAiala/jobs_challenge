class RecruitersController < ApplicationController
  before_action :authenticate_recruiter!
  before_action :set_recruiter, only: [:update]

  def index
    @recruiters = Recruiter.all
  end

  def update
    if @recruiter.update(recruiter_params)
      render json: @recruiter, status: :ok
    else
      render json: { errors: @recruiter.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find(params[:id])
  end

  def recruiter_params
    params.require(:recruiter).permit(:email)
  end
end
