class User < ApplicationRecord
  before_create :generate_user_token

  def generate_user_token
    begin
      new_u_token = SecureRandom.base64
    end while User.find_by(token: new_u_token)
    self.token = new_u_token
  end
end
