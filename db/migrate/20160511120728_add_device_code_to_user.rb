class AddDeviceCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :device_code, :string
  end
end
