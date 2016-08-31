class RemoveAvatarFromPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :avatar
  end
end
