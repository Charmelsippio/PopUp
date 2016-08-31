class AddTitleAndLengthFieldsToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :title, :string
    add_column :podcasts, :length, :datetime
  end
end
