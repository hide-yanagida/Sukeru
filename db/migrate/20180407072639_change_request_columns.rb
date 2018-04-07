class ChangeRequestColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :from_datetime, :datetime
    add_column :requests, :to_datetime, :datetime
    remove_column :requests, :from_date, :date
    remove_column :requests, :from_time, :time
    remove_column :requests, :to_date, :date
    remove_column :requests, :to_time, :time
  end
end
