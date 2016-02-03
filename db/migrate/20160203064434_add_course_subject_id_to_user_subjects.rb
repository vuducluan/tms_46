class AddCourseSubjectIdToUserSubjects < ActiveRecord::Migration
  def change
    add_column :user_subjects, :course_subject_id, :integer
  end
end
