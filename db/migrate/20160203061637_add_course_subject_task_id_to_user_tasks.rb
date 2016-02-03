class AddCourseSubjectTaskIdToUserTasks < ActiveRecord::Migration
  def change
    add_column :user_tasks, :course_subject_task_id, :integer
  end
end
