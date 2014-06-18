namespace :moves_points do
  desc 'Update all user data'
  task update_user_data: :environment do
    User.find_each do |user|
      user.update_data
    end
  end
end
