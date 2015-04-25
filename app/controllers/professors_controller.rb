class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @professors = Professor.all
    respond_with(@professors)
  end

  def show
    respond_with(@professor)
  end

  def new
    @professor = Professor.new
    respond_with(@professor)
  end

  def edit
  end

  def create
    @professor = Professor.new(professor_params)
    flash[:notice] = 'Professor was successfully created.' if @professor.save
    respond_with(@professor)
  end

  def update
    flash[:notice] = 'Professor was successfully updated.' if @professor.update(professor_params)
    respond_with(@professor)
  end

  def destroy
    @professor.destroy
    respond_with(@professor)
  end

  private
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def professor_params
      params.require(:professor).permit(:first_name, :last_name, :title)
    end
end
