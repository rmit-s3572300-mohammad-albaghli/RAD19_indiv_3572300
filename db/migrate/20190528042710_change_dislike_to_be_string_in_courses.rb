class ChangeDislikeToBeStringInCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :dislike, :string
  end
end
