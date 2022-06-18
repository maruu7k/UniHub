class AddDescriptionToUniversity < ActiveRecord::Migration[6.1]
  def change
    add_column :universities, :description, :text
  end
end
