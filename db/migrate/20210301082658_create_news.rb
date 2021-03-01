class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
