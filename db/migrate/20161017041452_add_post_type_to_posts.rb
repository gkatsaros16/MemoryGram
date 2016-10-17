class AddPostTypeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :post_type, :string
    add_column :posts, :link, :string
  end
end
