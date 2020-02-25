class AddUserId < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :users, foreign_key: true
    add_reference :articles, :users, foreign_key: true
  end
end
