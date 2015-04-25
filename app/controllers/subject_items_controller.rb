class SubjectItemsController < ApplicationController
	expose(:subjects)
	expose(:subject)
	expose(:subject_item, ancestor: :subject, attributes: :subject_item_params) { SubjectItem.new }

	def create
		subject_item = SubjectItem.new(subject_item_params)
		subject_item.subject_id = subject.id
		if subject_item.save
			flash[:notice] = "New item added successfully."
			redirect_to subject_subject_items_path(subject.id)
		else
			flash[:error] = "Error while adding new item."
			render 'new'
		end
	end

	private

  def subject_item_params
    params.require(:subject).permit({subject_item: [:description]})[:subject_item]
  end 
end