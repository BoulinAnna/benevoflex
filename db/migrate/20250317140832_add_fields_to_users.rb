class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :competence, :string
    add_column :users, :photo_url, :string
  end
end
