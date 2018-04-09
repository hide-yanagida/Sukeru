class AddRequestsColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :image_name, :string
  end
end
