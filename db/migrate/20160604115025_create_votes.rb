class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :link_id
      t.integer :user_id
      t.boolean :up_vote

      t.timestamps null: false
    end
  end
end
