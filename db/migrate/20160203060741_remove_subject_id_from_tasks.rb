class RemoveSubjectIdFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :subject_id, :integer
  end
end
