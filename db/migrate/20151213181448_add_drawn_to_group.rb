class AddDrawnToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :drawn, :boolean
  end
end
