module Requests
  module AuthenticationHelpers
    def login(user)
      post '/users/sign_in', "user[email]" => user.email, "user[password]" => user.password
    end
  end
end
