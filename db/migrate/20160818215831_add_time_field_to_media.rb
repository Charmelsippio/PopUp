class AddTimeFieldToMedia < ActiveRecord::Migration
  def change
    add_column :media, :time, :string
  end
end
