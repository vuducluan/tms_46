class AddSubjectIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :subject_id, :integer
  end
end
