class CreateComments < ActiveRecord::Migration
  def change
     create_table :comments do |t|
      t.string :text, null: false
      t.integer :commentable_id
      t.string :commentable_type
      t.string :commenter_id

      t.timestamps
    end
  end
end
