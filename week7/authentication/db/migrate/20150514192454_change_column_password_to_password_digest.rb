class ChangeColumnPasswordToPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
    change_table :users do |t|
      t.string :password_digest
    end
    add_index :users, :password_digest
  end
end
