class AddFieldsToApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :unihub_applications, :cgpa_or_percentage, :string, null: false, default: ''
    add_column :unihub_applications, :current_institution, :string, null: false, default: ''
  end
end
