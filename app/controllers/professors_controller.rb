class ProfessorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin!, except: [:index, :show, :upvote, :downvote]
  expose(:professors)
  expose(:professor, attributes: :professor_params)
  expose(:comments)
  expose(:comment) { Comment.new }

  respond_to :html

  def index 
    @professors = Professor.paginate(:page => params[:page], :per_page => 10)
  end
  
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

  def upvote
    unless current_user.voted_for? professor
      professor.liked_by current_user
    else
      already_voted(professor)
    end
    redirect_to(professor)
  end

  def downvote
    unless current_user.voted_for? professor
      professor.disliked_by current_user
    else
      already_voted(professor)
    end
    redirect_to(professor)
  end

  private

  def professor_params
    params.require(:professor).permit(:first_name, :last_name, :title)
  end
end
