class CreateSecretSanta < ActiveRecord::Migration
  def change
    create_table :secret_santa do |t|
      t.integer :participant_id
      t.integer :friend_id
      t.integer :group_id
    end
  end
end
