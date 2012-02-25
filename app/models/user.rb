class User < ActiveResource::Base

  self.site = "http://ls/"
  self.element_name = "webuser"

  def self.all_cached
    Rails.cache.fetch("remote_users", :expires_in => 30.minutes) do
      self.find(:all)
    end
  end

end
