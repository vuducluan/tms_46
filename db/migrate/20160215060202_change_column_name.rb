class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :activities, :type, :type_activity
  end
end
