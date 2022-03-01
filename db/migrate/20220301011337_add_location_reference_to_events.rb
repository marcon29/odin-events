class AddLocationReferenceToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :location, foreign_key: true
  end
end
