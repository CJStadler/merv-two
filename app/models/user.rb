class User < ActiveRecord::Base
    has_secure_password

    has_many :logs


    def log
        logs.first
    end
end
