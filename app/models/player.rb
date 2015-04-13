class Player < ActiveRecord::Base
    validates :username,    presence: true, length: { maximum: 50 }
    validates :email,       presence: true, length: { maximum: 255 }
    def initialize(username, email)
        @username = username
        @email = email
        @balance = 0
    end
    
    def balance
        @balance
    end
end
