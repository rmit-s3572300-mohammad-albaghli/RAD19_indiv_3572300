class ChangeLikeToBeStringInCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :like, :string
  end
end
