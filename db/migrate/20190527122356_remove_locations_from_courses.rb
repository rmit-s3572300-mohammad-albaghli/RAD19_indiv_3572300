class RemoveLocationsFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :locations, :serialize
  end
end
