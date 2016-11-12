class AddUserToNetworks < ActiveRecord::Migration
  def change
    add_reference :networks, :user, index: true, foreign_key: true
  end
end
