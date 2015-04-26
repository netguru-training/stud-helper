namespace :recreate_images do

  task run: :environment do
    User.find_each do |user|
      user.picture.recreate_versions! if user.picture?
    end
  end

end
