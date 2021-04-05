class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
