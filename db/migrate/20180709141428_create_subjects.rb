class CreateSubjects < ActiveRecord::Migration[5.2]
  def up
    create_table :subjects do |t|
      t.string "name"
      t.string "position"
      t.boolean "visibile", :default => false
      t.timestamps
    end
  end
  def down
    drop_table :subjects
  end

end
