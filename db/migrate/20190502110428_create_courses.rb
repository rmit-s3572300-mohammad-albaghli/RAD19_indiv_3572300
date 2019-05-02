class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :prerequisite
      t.string :category
      t.string :location
      t.integer :like
      t.integer :dislike
      t.integer :user_id
      t.timestamps
    end
  end
end
