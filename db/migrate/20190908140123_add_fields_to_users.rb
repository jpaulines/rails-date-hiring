class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :description, :string
    add_column :users, :profile_image, :string
    add_column :users, :height, :string
    add_column :users, :strength, :string
    add_column :users, :language, :string
    add_column :users, :hidden_talent, :string
    add_column :users, :talkativeness, :integer
    add_column :users, :funniness, :integer
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :email, :string
  end
end
