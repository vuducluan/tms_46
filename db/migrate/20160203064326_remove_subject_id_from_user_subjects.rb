class RemoveSubjectIdFromUserSubjects < ActiveRecord::Migration
  def change
    remove_column :user_subjects, :subject_id, :integer
  end
end
