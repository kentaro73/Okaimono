class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to new_task_path, notice: "#{@task.name}、#{@task.number}個を登録しました"
    else
      render :new
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_path, notice: "#{task.name}を削除しました"
  end

  def destroy_all
    current_user.tasks.destroy_all
    redirect_to new_task_path, notice: "全件削除しました"
  end

  private

    def task_params
      params.require(:task).permit(:name, :number)
    end
end
