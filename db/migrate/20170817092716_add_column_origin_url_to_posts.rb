class AddColumnOriginUrlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :origin_url, :string
  end
end
