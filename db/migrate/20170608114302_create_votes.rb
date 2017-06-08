class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id,  foreign_key: true
      t.integer :votable_id
      t.string :votable_type

      t.timestamps
    end
  end
end
