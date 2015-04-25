class ProfessorController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  private
    def check_if_admin
      unless current_user.admin?
        redirect_to professors_path, notice: 'This operation is unavailable to your' unless current_user.admin?
    end
end
