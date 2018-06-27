class CreatePayReceipts < ActiveRecord::Migration
  def change
    create_table :pay_receipts do |t|
      t.integer   :owner_id
      t.string     :content
    end
  end
end
