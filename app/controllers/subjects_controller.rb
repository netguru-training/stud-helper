class SubjectsController < ApplicationController
  # before_action :set_subject, only: [:show, :edit, :update, :destroy]
  expose(:subjects)
  expose(:subject, attributes: :subject_params)
  respond_to :html

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