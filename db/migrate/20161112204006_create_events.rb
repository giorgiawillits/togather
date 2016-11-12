class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      
      t.timestamps null: false
    end
  end
end
