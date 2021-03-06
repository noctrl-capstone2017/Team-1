#extra notes for Tommy B:
#   rails server -b $IP -p $PORT

# author: Tommy B
class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
  end
  
  #author: Matthew O
  def home
    @teacher = Teacher.find(params[:id])
    @top_students = Student.where(id: Session.where(session_teacher: @teacher.id).group('session_student').order('count(*)').select('session_student').limit(8))
    if params[:start_session]
        @session = Session.new
        @session.session_teacher = @teacher.id
        @session.session_student = params[:student_id]
        @session.start_time = Time.now
        respond_to do |format|
          if @session.save
            format.html { redirect_to @session, notice: 'Session was successfully created.' }
            format.json { render :show, status: :created, location: @session }
          else
            format.html { render :new }
            format.json { render json: @session.errors, status: :unprocessable_entity }
          end
        end
    elsif params[:analyze]
        # Currently unimplemented will direct to analysis page for the selected student
    end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:user_name, :teacher_icon_name, :teacher_name, :teacher_email, :admin_powers, :analysis_powers, :teacher_description, :color, :school_id, :teacher_password, :teacher_password_confirmation)
    end
    
      # RH
      # Confirms an admin user.
    def admin_user
        redirect_to(root_url) unless current_user.admin_powers?
    end
    
end
