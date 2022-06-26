class CreateDegrees < ActiveRecord::Migration[6.1]
  def change
    create_table :degrees do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end

    drop_join_table :universities, :courses

    create_join_table :universities, :degrees do |t|
      t.index %i[university_id degree_id]
      t.index %i[degree_id university_id]
    end

    create_join_table :degrees, :courses do |t|
      t.index %i[degree_id course_id]
      t.index %i[course_id degree_id]
    end
  end
end
