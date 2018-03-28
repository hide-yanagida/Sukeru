class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :email
      t.text :password
      t.text :name
      t.text :image_name

      t.timestamps
    end
  end
end
