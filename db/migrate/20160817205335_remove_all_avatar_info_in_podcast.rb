class RemoveAllAvatarInfoInPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :avatar_file_name
    remove_column :podcasts, :avatar_file_size
    remove_column :podcasts, :avatar_content_type
    remove_column :podcasts, :avatar_updated_at    
  end
end
