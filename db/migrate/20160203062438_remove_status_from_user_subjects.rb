class RemoveStatusFromUserSubjects < ActiveRecord::Migration
  def change
    remove_column :user_subjects, :status, :string
  end
end
