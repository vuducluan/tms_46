class AddStatusToCourseSubject < ActiveRecord::Migration
  def change
    add_column :course_subjects, :status, :integer, default: 0
  end
end
