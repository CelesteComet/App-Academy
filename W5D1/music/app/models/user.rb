# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true 

  attr_reader :password 

  after_initialize :ensure_session_token

  def self.generate_session_token 
    SecureRandom::urlsafe_base64(16)  
  end

  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_is(password) 
    BCrypt::Password.new(self.password_digest) == password 
  end

  def self.find_by_credentials(creds)
    user = User.find_by(email: creds[:email])
    if user && user.password_is(creds[:password])
      user 
    else 
      nil
    end
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
  end

  private

  def ensure_session_token 
    self.session_token = self.session_token || User.generate_session_token
  end

  def user_params
    params.require(:user).permit(:email, :password) 
  end



end
