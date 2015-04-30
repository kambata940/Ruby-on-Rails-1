class TasksController < ApplicationController
  def index
    @lecture = Lecture.find(params[:lecture_id])
    @tasks = @lecture.tasks
  end

  def show
    @lecture = Lecture.find(params[:lecture_id])
    @task = @lecture.tasks.find(params[:id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.new
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.new(name: params[:task][:name],
                     lecture_id: params[:lecture_id],
                     description: params[:task][:description]
                     )
    if @task.save
      redirect_to lecture_task_path(@lecture, @task),
                  status: "The new task is successfully created!"
    else
      render :new
    end
  end


  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:lecture_id])
    @task = @lecture.tasks.find(params[:id])
    is_successfull = @task.update(name: params[:task][:name],
                                  lecture_id: params[:lecture_id],
                                  description: params[:task][:description]
                                  )
    if is_successfull
      redirect_to lecture_task_path(@lecture, @task), notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to lecture_tasks_path, notice: "task #{@task.id} was deleted"
  end
end