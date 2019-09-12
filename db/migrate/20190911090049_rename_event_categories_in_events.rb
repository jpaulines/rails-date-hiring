class RenameEventCategoriesInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :event_categories
    add_reference :events, :event_category, foreign_key: true
  end
end
