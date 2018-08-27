class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @categories = Category.all
    @companies = Company.all
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
    # implement on your own!
  end

  def update
    # implement on your own!
  end

  def destroy
    # implement on your own!
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
