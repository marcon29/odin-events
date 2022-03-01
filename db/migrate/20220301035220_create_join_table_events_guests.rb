class CreateJoinTableEventsGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :events_guests do |t|
      t.references :attended_event, foreign_key: {to_table: :events}
      t.references :guest, foreign_key: {to_table: :users}
    end
  end
end
