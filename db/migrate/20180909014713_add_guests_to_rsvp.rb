class AddGuestsToRsvp < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :guests, :integer
  end
end
