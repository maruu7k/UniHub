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
    unihub_application = UnihubApplication.create!(unihub_application_params.except(:country))
    if unihub_application.save!
      UserMailer.new_application_submitted_admin(unihub_application.id).deliver_now
      flash[:notice] = 'Your application is submitted successfully.'
    else
      flash[:alert] = 'Application submission error. Please contact support.'
    end
    redirect_to root_path
  end

  private

  def unihub_application_params
    params.require(:unihub_application).permit(:current_qualification, :interested_qualification, :country, :course,
                                               :accomodation_required, :cgpa_or_percentage, :current_institution, file: [])
          .merge(user_id: current_user.id, status: 0, country_id: users_country)
  end

  def filter_params
    unihub_application_params[:current_qualification].downcase!
    unihub_application_params[:interested_qualification].downcase!
  end

  def users_country
    @country_id = Country.find_by(name: params[:unihub_application][:country]).id
  end
end
