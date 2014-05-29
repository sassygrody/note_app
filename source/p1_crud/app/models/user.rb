class User < ActiveRecord::Base
  	# or validates email (whatever is unique)
  	validates :username, uniqueness: true, presence: true
  	validates :password_hash, :presence => true

  	has_many :notes


  include BCrypt
	def password
		@password ||= Password.new(password_hash)
	end

	def password=(pass)
		@password = Password.create(pass)
		self.password_hash = @password
	end


	def self.authenticate(username, password)
		@user = User.find_by_username(username)
		puts @user
		
		if @user && @user.password == password
			return @user
		else
			return nil
		end
	end

	  # def self.authenticate(username, password_input)
	  #   user = User.find_by_username(username)
	  #   return user if user && (user.password == password_input)
	  #   nil
	  # end

end
