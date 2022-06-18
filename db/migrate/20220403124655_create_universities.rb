class CreateUniversities < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |t|
      t.string :name, null: false, default: ''
      t.references :country, foreign_key: true
      t.timestamps
    end
  end
end
