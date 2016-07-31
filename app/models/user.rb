require 'bcrypt'
class User
  include DataMapper::Resource

  property :id,                         Serial
  property :name,                       String
  property :email,                      String
  property :user_name,                  String
  property :password_digest,            String, length: 60

  attr_reader   :password
  attr_accessor :password_confirmation

 validates_confirmation_of       :password
 validates_format_of :email, as: :email_address


 def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
 end


 # def self.authenticate(email, password)
 #   user = first(email: email)
 #   return user if (user && BCrypt::Password.new(user.password_digist) == password)
 #   nil
 # end
end