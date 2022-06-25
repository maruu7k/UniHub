# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @universities = University.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def my_application
    @all_applications = []
    unihub_applications = current_user.unihub_applications

    if unihub_applications.nil?
      flash[:alert] = 'You do not have any ongoing application.'
      redirect_to root_path
    else
      unihub_applications.map do |app|
        active = if app.status == 'submitted'
                   0
                 elsif app.status == 'processing'
                   1
                 elsif app.status == 'university_accepted'
                   2
                 elsif app.status == 'visa_processing'
                   3
                 elsif app.status == 'visa_approved'
                   4
                 else
                   -1
                 end
        @all_applications << [app, active]
      end
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

  def search
    redirect_to root_path and return if params[:search].blank?

    @parameter = params[:search].downcase
    @universities = University.all.where('lower(name) LIKE :search',
                                         search: "%#{@parameter}%").order(created_at: :desc).page(params[:page]).per(9)
    flash[:alert] = "No Universities found with name #{params[:search]}" if @universities.nil?

    render :index
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
