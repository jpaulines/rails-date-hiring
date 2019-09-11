class ChangeEventCategoryInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_category
    add_reference :events, :event_categories, foreign_key: true
  end
end
