class CreateAddressesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :state
      end
  end
end
