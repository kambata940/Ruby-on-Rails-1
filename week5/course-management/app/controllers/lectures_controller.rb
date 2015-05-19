  class LecturesController < ApplicationController
  
  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def create
    @lecture = Lecture.new(name: params[:lecture][:name],
                           body: params[:lecture][:body])
    if @lecture.save
      redirect_to @lecture, notice: "Successfull created new lecture"
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    lecture_params = params[:lecture]
    @lecture = Lecture.find(params[:id])
    is_successfull = @lecture.update(name: lecture_params[:name],
                                     body: lecture_params[:body])
    if is_successfull
      redirect_to @lecture, notice: "Updated !"
    else
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_path, notice: "Lecture with id #{@lecture.id} was deleted"
  end
end