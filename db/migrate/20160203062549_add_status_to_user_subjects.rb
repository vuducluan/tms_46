class AddStatusToUserSubjects < ActiveRecord::Migration
  def change
    add_column :user_subjects, :status, :integer
  end
end
