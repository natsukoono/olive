class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :image_id
      t.integer :user_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
