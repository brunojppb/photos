class User < ActiveRecord::Base
    has_many :photos

    #configure security
    has_secure_password

    def name
        return "#{first_name} #{last_name}"
    end
end
