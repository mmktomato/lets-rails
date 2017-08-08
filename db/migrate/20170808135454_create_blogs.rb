class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :screen_name
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps

      t.index :screen_name, unique: true
    end
  end
end
