class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :subject_id
      t.string :name

      t.timestamps null: false
    end
  end
end
