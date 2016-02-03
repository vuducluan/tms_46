class RemoveTaskIdFromUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :task_id, :integer
  end
end
