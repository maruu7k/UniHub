# frozen_string_literal: true

class UniversitiesController < ApplicationController
  def show
    @university = University.find(params[:id])
  end
end
