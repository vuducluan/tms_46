class RemoveStatusFromUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :status, :string
  end
end
