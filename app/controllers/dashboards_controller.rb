# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @universities = University.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def my_application
    @unihub_application = current_user.unihub_application
    @active = if @unihub_application.status == 'submitted'
                0
              elsif @unihub_application.status == 'processing'
                1
              elsif @unihub_application.status == 'university_accepted'
                2
              elsif @unihub_application.status == 'visa_processing'
                3
              elsif @unihub_application.status == 'visa_approved'
                4
              else
                -1
              end
    if @unihub_application.nil?
      flash[:alert] = 'You do not have an ongoing application.'
      redirect_to root_path
    end
  end

  def new_contact
    @contact = Contact.new(contact_params)

    if @contact.save
      UserMailer.contact_form_submitted_admin(@contact.id).deliver_now
      flash[:notice] = 'Query submitted successfully. We will be in contact with you soon.'
      redirect_to root_path
    else
      flash[:alert] = 'Could not submit your query.'
      render :contact
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
