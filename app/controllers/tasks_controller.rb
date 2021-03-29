class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to new_task_path, notice: "#{@task.name}、#{@task.number}個を登録しました"
    else
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path, notice: "#{task.name}を削除しました"
  end

  def destroy_all
    Task.destroy_all
    redirect_to new_task_path, notice: "全件削除しました"
  end

  private

    def task_params
      params.require(:task).permit(:name, :number)
    end
end
