class AddLinksTitlesToMedia < ActiveRecord::Migration
  def change
    add_column :media, :link, :string
    add_column :media, :title, :string
  end
end
