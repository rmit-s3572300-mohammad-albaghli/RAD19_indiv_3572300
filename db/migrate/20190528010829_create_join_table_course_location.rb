class CreateJoinTableCourseLocation < ActiveRecord::Migration[5.1]
  def change
    create_join_table :courses, :locations do |t|
      # t.index [:course_id, :location_id]
      # t.index [:location_id, :course_id]
    end
  end
end
