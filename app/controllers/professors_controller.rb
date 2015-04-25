class ProfessorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin!, except: [:index, :show]
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  expose(:professors)
  expose(:professor)

  respond_to :html

  def edit
  end

  def create
    flash[:notice] = 'Professor was successfully created.' if professor.save
    respond_with(professor)
  end

  def update
    flash[:notice] = 'Professor was successfully updated.' if @professor.update(professor_params)
    respond_with(professor)
  end

  def destroy
    professor.destroy
    respond_with(professor)
  end

  private
    def professor_params
      params.require(:professor).permit(:first_name, :last_name, :title)
    end
end
