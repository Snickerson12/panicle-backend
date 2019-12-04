class AddGroupIdToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :group_id, :integer
  end
end
