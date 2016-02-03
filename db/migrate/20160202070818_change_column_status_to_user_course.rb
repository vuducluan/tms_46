class ChangeColumnStatusToUserCourse < ActiveRecord::Migration
  def change
    remove_column :user_courses, :status
    add_column :user_courses, :status, :integer, default: 0
  end
end
