class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name, required: true
      t.string :last_name, required: true
      t.string :middle_name

      t.timestamps
    end
  end
end
