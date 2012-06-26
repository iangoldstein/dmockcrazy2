class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :candidate
      t.references :user
      t.timestamps
    end
    add_index :votes, :candidate_id
  end
end
