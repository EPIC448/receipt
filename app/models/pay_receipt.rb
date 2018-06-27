class PayReceipt < ActiveRecord::Base

    belongs_to :owner
    validates :content, presence: true
end

