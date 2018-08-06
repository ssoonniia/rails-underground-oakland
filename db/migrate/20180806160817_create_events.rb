class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.name :string
      t.date :date
      t.time :time
      t.location :string
      t.cost :string
      t.description :text
      t.user_id :integer

      t.timestamps
    end
  end
end
