class AddPublicationWithRefNumberToResources < ActiveRecord::Migration
  def change
    add_column :resources, :publication, :string
    add_column :resources, :ref_no, :integar
  end
end
