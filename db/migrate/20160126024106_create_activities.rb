class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :target
      t.string :user_name
      t.integer :type

      t.timestamps null: false
    end
  end
end
