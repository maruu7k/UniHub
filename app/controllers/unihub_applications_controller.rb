# frozen_string_literal: true

class UnihubApplicationsController < ApplicationController
  before_action :filter_params, only: [:create]

  def new
    if current_user.nil?
      flash[:alert] = 'Please login to apply.'
      redirect_to new_user_session_path
    else
      @unihub_application = UnihubApplication.new
    end
  end

  def create
    if params[:unihub_application][:country].blank? || params[:unihub_application][:university].blank? || params[:unihub_application][:degree].blank? || params[:unihub_application][:course].blank?
      flash[:alert] = 'Application submission error due to missing fields. Please contact support.'
      return render :new
    else
      unihub_application = UnihubApplication.new(unihub_application_params.except(:country, :university, :course,
                                                                                  :degree))
      if unihub_application.save!
        UserMailer.new_application_submitted_admin(unihub_application.id).deliver_now
        flash[:notice] = 'Your application is submitted successfully.'
      else
        flash[:alert] = 'Application submission error. Please contact support.'
      end
    end

    redirect_to root_path
  end

  def universities_for_country
    @universities = Country.find_by(name: params[:country_name]).universities
    respond_to do |format|
      format.json { render json: @universities }
    end
  end

  def degrees_for_university
    @degrees = University.find_by(name: params[:university_name]).degrees
    respond_to do |format|
      format.json { render json: @degrees }
    end
  end

  def courses_for_degree
    p_courses = Degree.find_by(name: params[:degree_name]).courses
    university_ids = University.where(name: params[:university_name]).map(&:id)

    @courses = p_courses.where(university_id: university_ids)
    respond_to do |format|
      format.json { render json: @courses }
    end
  end

  private

  def unihub_application_params
    params.require(:unihub_application).permit(:current_qualification, :country, :university, :degree, :course,
                                               :accomodation_required, :cgpa_or_percentage, :current_institution, file: [])
          .merge(user_id: current_user.id, status: 0, country_id: users_country,
                 university_id: interested_university, degree_id: interested_degree, course_id: interested_course)
  end

  def filter_params
    unihub_application_params[:current_qualification].downcase!
  end

  def users_country
    @country_id = Country.find_by(name: params[:unihub_application][:country]).id
  end

  def interested_university
    University.find_by(name: params[:unihub_application][:university]).id
  end

  def interested_degree
    Degree.find_by(name: params[:unihub_application][:degree]).id
  end

  def interested_course
    course = Course.find_by(name: params[:unihub_application][:course])
    return nil if course.nil?

    course.id
  end
end
