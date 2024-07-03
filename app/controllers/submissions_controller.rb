class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show update destroy ]

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      render :show, status: :created, location: @submission
    else
      render :error, status: :unprocessable_entity
    end
  end

  private
    def submission_params
      params.require(:submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
    end
end
