class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :code
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
