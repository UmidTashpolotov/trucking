class AddSmsCodeAndPhoneCheckedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sms_code, :string
    add_column :users, :phone_checked, :boolean, default: false
  end
end
