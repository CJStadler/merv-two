class User < ActiveRecord::Base
    has_secure_password

    has_many :logs

    validates_presence_of :name
    validates_uniqueness_of :name

    def log
        logs.first
    end
end
