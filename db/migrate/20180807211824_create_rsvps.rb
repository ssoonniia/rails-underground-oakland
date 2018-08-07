class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.user_id :t.integer
      t.event_id :t.integer

      t.timestamps
    end
  end
end
