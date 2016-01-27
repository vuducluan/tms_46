class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :course_id
      t.string :status

      t.timestamps null: false
    end
  end
end
