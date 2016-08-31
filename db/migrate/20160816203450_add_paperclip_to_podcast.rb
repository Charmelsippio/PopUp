class AddPaperclipToPodcast < ActiveRecord::Migration
  def up
    add_attachment :podcasts, :avatar
  end

  def down
    remove_attachment :podcasts, :avatar
  end
end
