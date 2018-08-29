class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    if params[:location]
      @jobs = Job.where(city: params[:location])
    elsif params[:sort]
      @jobs = Job.order(level_of_interest: :desc)
    else
      @jobs = Job.all
    end
  end

  def new
    @categories = Category.all
    @companies = Company.all
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@job.company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Category.all
    @companies  = Company.all
  end

  def update
    @job.update(job_params)

    redirect_to job_path(@job)
  end

  def destroy
    @job.destroy

    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city)
    end

    def set_job
      @job = Job.find(params[:id])
    end
end
