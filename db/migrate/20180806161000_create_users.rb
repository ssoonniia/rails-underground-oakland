class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.username :string
      t.email :string
      t.password_digest :string

      t.timestamps
    end
  end
end
