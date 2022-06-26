class AddCoursesToUniversity < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :university, null: false, index: true, foreign_key: true
  end
end
