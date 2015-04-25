class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose(:comments)
  expose(:comment, attributes: :comment_params)

  # def index
  #   respond_with(comments)
  # end

  def show
    respond_with(comment.owner)
  end

  def new
    comment = Comment.new
    respond_with(comment.owner)
  end

  def create
    comment.user = current_user
    comment.owner = fetch_owner
    if comment.save
      redirect_to(professor_path(comment.owner))
    else
      redirect_to root_path #WIP
    end
  end

  def update
    comment.user_id = current_user.id
    comment.update(comment_params)
    respond_with(comment.owner)
  end

  def destroy
    comment.destroy
    respond_with(comment.owner)
  end

  private

  def fetch_owner
    Professor.find_by(id: params[:professor_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
