class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, index: true, null: false
      t.string :last_name, index: true, null: false
      t.string :email, index: true, null: false, unique: true
      t.string :password, index: true, null: false
    end
  end
end
