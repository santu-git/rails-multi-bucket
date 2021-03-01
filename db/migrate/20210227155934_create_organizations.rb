class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :industry
      t.text :address
      t.string :bucket_name

      t.timestamps
    end
  end
end
