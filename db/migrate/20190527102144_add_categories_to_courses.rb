class AddCategoriesToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :categories, :serialize
  end
end
