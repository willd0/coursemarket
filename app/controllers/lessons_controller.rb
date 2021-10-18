class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /lessons or /lessons.json
  def index
    @section = Section.find(params[:section_id])
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @section = Section.find(params[:section_id])
    redirect_to course_section_lessons_path, notice: "Not Authorized to Create Lessons for this Section" if @section.course.user != current_user
    @lesson = Lesson.new(section_id: params[:section_id])
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to course_section_lessons_path, notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to course_section_lessons_path, notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to course_section_lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    redirect_to course_section_lesson_path, notice: "Not Authorized To Edit This Lesson" if current_lesson.section.course.user != current_user
  end

  private

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:name, :lesson_id, :lesson_number, :lesson_text, :section_id)
    end
end
