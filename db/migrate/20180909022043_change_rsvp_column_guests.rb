class ChangeRsvpColumnGuests < ActiveRecord::Migration[5.2]
  def change
    rename_column :rsvps, :guests, :guest
  end
end
