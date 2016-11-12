class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.belongs_to :user, index: true
      
      t.timestamps null: false
    end
    
    create_table :posts_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
    end
  end
end
