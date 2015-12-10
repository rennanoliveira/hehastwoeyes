class CreateParticipant < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.string :comment
      t.integer :group_id
    end

    add_index :participants, :user_id
    add_index :participants, :group_id
    add_index :participants, [:user_id, :group_id], unique: true
  end
end
