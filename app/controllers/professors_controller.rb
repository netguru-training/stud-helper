class ProfessorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin!, except: [:index, :show]
  expose(:professors)
  expose(:professor, attributes: :professor_params)
  expose(:comment){Comment.new}

  respond_to :html

  def create
    if professor.save
      redirect_to(professors_path)
    else
      render :new
    end
  end

  def update
    if professor.update(professor_params)
      redirect_to(professors_path)
    else
      render :edit
    end
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
