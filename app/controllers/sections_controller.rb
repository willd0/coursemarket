class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /sections or /sections.json
  def index
    @course = Course.find(params[:course_id])
    redirect_to courses_path, notice: "Not Authorized to Access this Course" if (current_user.enrolled_in?(@course) == false) && (@course.user != current_user)
    @sections = Section.all
  end

  # GET /sections/1 or /sections/1.json
  def show
    @course = Course.find(params[:course_id])
    redirect_to courses_path, notice: "Not Authorized to Access this Course" if (current_user.enrolled_in?(@course) == false) && (@course.user != current_user)
  end

  # GET /sections/new
  def new
    @course = Course.find(params[:course_id])
    redirect_to course_sections_path, notice: "Not Authorized to Create Sections for this Course" if @course.user != current_user
    @section = Section.new(course_id: params[:course_id])
    
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params) 
     

    respond_to do |format|
      if @section.save
        format.html { redirect_to course_sections_path, notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to course_sections_path, notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to course_sections_url, notice: "Section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    redirect_to course_section_path, notice: "Not Authorized To Edit This Section" if current_section.course.user != current_user
  end

  private

  def current_section
    @current_section ||= Section.find(params[:id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:name, :section_id, :section_number, :course_id)
    end
end
