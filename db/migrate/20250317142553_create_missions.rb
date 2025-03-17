class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :category
      t.date :start_date
      t.date :end_date
      t.string :address
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
