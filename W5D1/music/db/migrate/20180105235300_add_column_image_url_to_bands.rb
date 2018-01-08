class AddColumnImageUrlToBands < ActiveRecord::Migration[5.1]
  def change
    add_column :bands, :image_url, :string
  end
end
