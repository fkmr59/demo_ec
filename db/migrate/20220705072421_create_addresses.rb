class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :family_name
      t.string :given_name
      t.string :tel
      t.string :email
      t.string :postal_code
      t.string :address_level1
      t.string :address_level2
      t.string :address_line1
      t.string :address_line2
      t.string :organization

      t.timestamps
    end
  end
end
