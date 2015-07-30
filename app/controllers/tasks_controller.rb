#encoding: utf-8
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all 
  end 
  def show
  	@task = Task.find(params[:id])
  end   
  def new 
  	@task = Task.new
  end
  def create
  	@task = Task.new(task_params)
  	if @task.save 
  		redirect_to tasks_path(@task), notice: "Kayıt Başarılı"
  	else
  		render :new, notice: "Kayıt Başarısız"
  	end 
  end
  def destroy
  	@task.destroy
  	redirect_to tasks_url, notice: 'Başarılı bir şekilde silindi.'
  end
  def update
      if @task.update(task_params)
        redirect_to tasks_path(@task), notice: 'Bilgiler güncellendi' 
      else
        render :edit 
      end
  end

  private
  def task_params
  	params.require(:task).permit(:name)
  end
  def set_task
      @task = Task.find(params[:id])
    end
end
