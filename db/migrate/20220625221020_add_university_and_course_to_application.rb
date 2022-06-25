class AddUniversityAndCourseToApplication < ActiveRecord::Migration[6.1]
  def change
    add_reference :unihub_applications, :university, null: false, foreign_key: true
    add_reference :unihub_applications, :course, null: false, foreign_key: true
    remove_column :unihub_applications, :course
  end
end
