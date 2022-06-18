class CreateUnihubApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :unihub_applications do |t|
      t.integer :current_qualification, null: false, default: 0
      t.integer :interested_qualification, null: false, default: 0
      t.string :course, null: false, default: ''
      t.boolean :accomodation_required, null: false, default: false
      t.integer :status, null: false, default: 0
      t.references :country, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
