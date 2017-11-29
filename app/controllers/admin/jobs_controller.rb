class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @jobs = current_user.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper, :wage_lower, :contact, :is_hidden)
  end
end
