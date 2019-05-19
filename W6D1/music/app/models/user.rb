class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true

    # Calls our method to ensure the user has a session token, or one is generated
    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    # Calls generate_session_token to create a new session token
    # Persists this user instance to the databse
    # Returns the new session token
    # Have to call 'self.session_token' instead of '@session_token' in order to
    # call self.save to add/update our database row with that user.
    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        return self.session_token
    end

    # Ensures that the user instance has a session_token
    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
    
    # Creates a password digest and assigns it to the user instance
    # Also, creates an instance variable for @password 
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    # Creates a new instance of BCrypt Password with the value of the 
    # password_digest and calls is_password? to ensure the password the user
    # logged in with is equal to the password digest we have saved in the db 
    # for that user.
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        if !user.nil? && user.is_password?(password)
            return user
        else
            return nil
        end
    end

end
