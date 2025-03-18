class AddPhotoUrlToMission < ActiveRecord::Migration[7.1]
  def change
    add_column :missions, :photo_url, :string
  end
end
