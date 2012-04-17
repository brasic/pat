class User < ActiveResource::Base

  self.site = "http://localhost:3001/"
  self.element_name = "webuser"

  # only fetch this once in a while
  def self.all_cached
    begin
      Rails.cache.fetch("remote_users", :expires_in => 30.minutes) do
        self.find(:all)
      end
    rescue Errno::ECONNREFUSED 
      warn "Not able to connect to the auth server, login will be unavailable..."
      []
    end
  end

  def self.expire
    Rails.cache.delete("remote_users")
  end

  # calls the remote LS server to log in
  def self.login(username,password)
    begin
      response = self.post(:sign_in,
                         'webuser[username]'=>username,
                         'webuser[password]'=>password
                        ).response
    rescue ActiveResource::UnauthorizedAccess => ex
      return ex.response
    end
  end

end

