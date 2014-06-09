Rails.application.config.middleware.use OmniAuth::Builder do
  provider :moves, ENV['MOVES_CLIENT_ID'], ENV['MOVES_CLIENT_SECRET'], scope: 'activity'
end
