class RemoveCourseIdFromUserSubjects < ActiveRecord::Migration
  def change
    remove_column :user_subjects, :course_id, :integer
  end
end
