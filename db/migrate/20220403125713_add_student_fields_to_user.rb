class AddStudentFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :last_name, :string, null: false, default: ''
    add_column :users, :age, :integer, null: false, default: 0
    add_column :users, :city, :string, null: false, default: ''
    add_column :users, :phone_number, :string, null: false, default: ''
    add_column :users, :interested_program, :string
  end
end
