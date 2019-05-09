class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.text :description
      t.string :first_name
      t.string :last_name
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
