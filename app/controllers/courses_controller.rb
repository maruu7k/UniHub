# frozen_string_literal: true

class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
    end
end
