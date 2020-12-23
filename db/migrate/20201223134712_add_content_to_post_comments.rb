class AddContentToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :content, :string
  end
end
