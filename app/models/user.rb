class User < ActiveRecord::Base
      before_save { |user| user.email = email.downcase }
      validates :name, presence: true, length: { in: 9..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
      validates :password, presence: true, length: { minimum: 6 }
      validates :password_confirmation, presence: true
      has_secure_password      # A magic method!!

      # Returns true if the given token matches the digest.
      def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end

      # Forgets a user.
       def forget
          update_attribute(:remember_digest, nil)
       end


    end