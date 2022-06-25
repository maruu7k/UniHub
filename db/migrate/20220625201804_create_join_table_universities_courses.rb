class CreateJoinTableUniversitiesCourses < ActiveRecord::Migration[6.1]
  def change
    create_join_table :universities, :courses do |t|
      t.index %i[university_id course_id]
      t.index %i[course_id university_id]
    end
  end
end
