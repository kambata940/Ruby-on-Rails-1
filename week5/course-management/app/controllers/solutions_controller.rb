class SolutionsController < ApplicationController
  def index
    load_lecture_and_task
    @solutions = @task.solutions
  end

  def show
    load_lecture_and_task
    load_solution
  end

  def new
    load_lecture_and_task
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(body: params[:solution][:body],
                             task_id: params[:task_id])
    if @solution.save
      redirect_to solutions_path, notice: "Successfull created solution!"
    else
      render :new
    end
  end

  def edit
    load_lecture_and_task
    load_solution
  end

  def update
    load_lecture_and_task
    load_solution
    if @solution.update(body: params[:solution][:body])
      redirect_to solution_path, notice: "Successfull updated!"
    else
      render :edit
    end
  end

  def destroy
    load_lecture_and_task
    load_solution
    @solution.delete
    redirect_to solutions_path, notice: "solution #{@solution.id} was deleted"
  end

  private
  def load_lecture_and_task
    @lecture = Lecture.find(params[:lecture_id])
    @task = @lecture.tasks.find(params[:task_id])
  end

  def load_solution
    @solution = @task.solutions.find(params[:id])
  end
end