require 'rails_helper'


RSpec.describe SubjectsController, type: :controller do
	let (:user) { create(:user) }

	let (:correct_subject_attributes) do
		{
			name: "asdasdasdas",
			short_name: "asd",
			description: "awdadawdawdwa"
		}
	end

	context "user is logged in" do
		before do
			sign_in user
		end
		context "user is not an admin" do
			describe "GET #index" do
				it "should return 200" do
					get :index
					expect(response).to have_http_status(:success)
				end
			end
			describe "GET #new" do
				it "should redirect to root_path" do
					get :new
					expect(response).to redirect_to root_path
				end
			end	

			describe "create new subject" do
				it "should redirect to root_path" do
					post :create, {subject: correct_subject_attributes}
					expect(response).to redirect_to root_path
				end
			end
		end

		context "user is an admin" do
			before do
				user.admin!
			end
			describe "GET #new" do
				it "should redirect to root_path" do
					get :new
					expect(response).to have_http_status(:success)
				end
			end	

			describe "create new subject" do
				it "should increment Subject.count by 1" do
					expect{
						post :create, {subject: correct_subject_attributes}
					}.to change{Subject.count}.from(0).to(1)
				end
			end

			describe "delete subject" do
				before do
					@subject = Subject.create!(correct_subject_attributes)
				end
				it "should delete subject" do
					expect {
						delete :destroy, {id: @subject.to_param}
					}.to change{Subject.count}.from(1).to(0)
				end
			end
		end
	end
end