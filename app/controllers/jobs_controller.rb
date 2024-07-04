class JobsController < ApplicationController
  before_action :set_job, only: %i[ show update destroy ]
  before_action :authenticate_recruiter!, only: %i[ create update destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :job_not_found

  def index
    @jobs = Job.active
    @jobs = @jobs.search(params[:query]) if params[:query].present?
  end

  def show
    @job
  end

  def create
    @job = Job.new(job_params)
    @job.recruiter = current_recruiter

    if @job.save
      render :show, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render :show, status: :ok, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_not_found(error)
      render :error, status: :not_found, location: @job
    end

    def job_params
      params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skill)
    end
end
