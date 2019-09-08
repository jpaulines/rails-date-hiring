class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.string :amenities
      t.string :event_description
      t.string :wishlist
      t.string :event_image
      t.references :user, foreign_key: true
      t.string :cost

      t.timestamps
    end
  end
end
