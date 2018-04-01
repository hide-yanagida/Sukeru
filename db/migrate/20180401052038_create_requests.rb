class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.text :title
      t.text :content
      t.datetime :from_date
      t.datetime :to_date
      t.text :address
      t.text :reward

      t.timestamps
    end
  end
end
