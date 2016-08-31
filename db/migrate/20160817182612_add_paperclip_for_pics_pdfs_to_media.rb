class AddPaperclipForPicsPdfsToMedia < ActiveRecord::Migration
  def up
    add_attachment :media, :document
  end

  def down
    remove_attachment :media, :document
  end
end
