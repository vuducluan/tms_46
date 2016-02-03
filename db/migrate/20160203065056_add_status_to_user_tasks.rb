class AddStatusToUserTasks < ActiveRecord::Migration
  def change
    add_column :user_tasks, :status, :integer, default: 0
  end
end
