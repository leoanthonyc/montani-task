class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, required: true
      t.string :isbn_13, required: true
      t.integer :list_price, required: true
      t.date :publication_year, required: true
      t.string :image_url
      t.string :edition
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
