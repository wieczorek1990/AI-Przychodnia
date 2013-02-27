class AddAdminUser < ActiveRecord::Migration
  def up
    user = User.new
    user.email = 'a@a.aa'
    user.password = 'paspas'
    user.first_name = 'Admin'
    user.last_name = 'Admin'
    user.type = 'Admin'
    user.save!
    user.confirm!
    user.add_role :admin
  end

  def down
    user = User.find(1)
    user.destroy
  end
end
