class AddPaperclipAudioToPodcast < ActiveRecord::Migration
  def up
    add_attachment :podcasts, :audio
  end

  def down
    remove_attachment :podcasts, :audio
  end
end
