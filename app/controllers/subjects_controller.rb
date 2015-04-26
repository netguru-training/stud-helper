class SubjectsController < ApplicationController
  expose(:subjects)
  expose(:subject, attributes: :subject_params)
  respond_to :html

  def index
    if params["/subjects"].present? && params["/subjects"]["search_token"].present?
      @subjects = Subject.search_by_short_name(params["/subjects"]["search_token"]).paginate(:page => params[:page], :per_page => 10)
    else
      @subjects = Subject.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def create
    self.subject = Subject.new(subject_params)
    if current_user.admin?
      flash[:notice] = 'Subject was successfully created.' if subject.save
      respond_with(subject)
    else
      flash[:error] = "You don't have admin permission."
      redirect_to root_path
    end
  end

  def update
    flash[:notice] = 'Subject was successfully updated.' if subject.update(subject_params)
    respond_with(subject)
  end

  def destroy
    subject.destroy
    respond_with(subject)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :short_name, :description)
  end 
end