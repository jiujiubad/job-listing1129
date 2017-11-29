class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @jobs = case params[:order]
            when "by_lower_up"
              Job.where(is_hidden: false).order("wage_lower ASC")
            when "by_lower_down"
              Job.where(is_hidden: false).order("wage_lower DESC")
            when "by_upper_up"
              Job.where(is_hidden: false).order("wage_upper ASC")
            when "by_upper_down"
              Job.where(is_hidden: false).order("wage_upper DESC")
            else
              Job.where(is_hidden: false).recent
            end
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      redirect_to root_path
      flash[:alert] = "职位已过期"
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper, :wage_lower, :contact, :is_hidden)
  end
end
