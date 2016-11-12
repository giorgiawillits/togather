class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.timestamps null: false
    end
 
    create_table :networks_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :network, index: true
    end
  end
end