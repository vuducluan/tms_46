class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.integer :course_id
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
