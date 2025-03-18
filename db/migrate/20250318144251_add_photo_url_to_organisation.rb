class AddPhotoUrlToOrganisation < ActiveRecord::Migration[7.1]
  def change
    add_column :organisations, :photo_url, :string
  end
end
