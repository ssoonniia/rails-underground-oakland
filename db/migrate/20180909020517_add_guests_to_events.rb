class AddGuestsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :guests, :integer
  end
end
