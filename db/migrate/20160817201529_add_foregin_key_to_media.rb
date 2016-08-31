class AddForeginKeyToMedia < ActiveRecord::Migration
  def change
    add_column :media, :podcast_id, :integer
  end
end
