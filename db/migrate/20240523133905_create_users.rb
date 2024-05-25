class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :phone_number
      t.string :email, null: false, index: true, unique: true
      t.string :password_digest
      t.string :user_type

      t.timestamps
    end
  end
end
