class CreateFavoritesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
