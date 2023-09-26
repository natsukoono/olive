class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.text :title
      t.text :body
      t.text :place
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
