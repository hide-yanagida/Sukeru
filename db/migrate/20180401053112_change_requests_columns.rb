class ChangeRequestsColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :from_time, :time
    add_column :requests, :to_time, :time
    change_column :requests, :from_date, :date
    change_column :requests, :to_date, :date
  end
end
