class Owner < ActiveRecord::Base
 validates_presence_of :name, :email, :password
    has_secure_password

    has_many :pay_receipts
end


