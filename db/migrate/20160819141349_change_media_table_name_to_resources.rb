class ChangeMediaTableNameToResources < ActiveRecord::Migration
  def change
    rename_table :media, :resources
  end
end
