class AddForeignKeyToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :admin_id, :integer
  end
end
