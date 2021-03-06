class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.timestamps null: false
    end
 
    create_table :groups_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
    end
  end
end