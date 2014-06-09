class Settings < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
  load!

  def to_hash
    {}.merge(self)
  end
end
