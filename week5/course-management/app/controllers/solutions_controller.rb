class SolutionsController < ApplicationController
  before_action :load_solution, only: [:show, :edit, :update, :destroy]
  def index
    @task = Task.find(params[:task_id])
  end

  def show
  end

  def new
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
  end

  def update
    if @solution.update(body: params[:solution][:body])
      redirect_to solution_path, notice: "Successfull updated!"
    else
      render :edit
    end
  end

  def destroy
    @solution.delete
    redirect_to solutions_path, notice: "solution #{@solution.id} was deleted"
  end

  private
  def load_solution
    @solution = Solution.find(params[:id])
  end
end