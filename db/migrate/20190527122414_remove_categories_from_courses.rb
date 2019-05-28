class RemoveCategoriesFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :categories, :serialize
  end
end
