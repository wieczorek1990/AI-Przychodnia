# encoding: utf-8
class AddTestUsers < ActiveRecord::Migration
  def up
    user = User.new
    user.email = 'p1@p.pp'
    user.password = 'paspas'
    user.first_name = 'Imie1'
    user.last_name = 'Nazwisko1'
    user.pesel = '12345678901'
    user.address = 'Ulica 1'
    user.postal_code = '00-001'
    user.city = 'Miasto 1'
    user.type = 'Patient'
    user.save!
    user.confirm!
    user.add_role :patient
    
    user = User.new
    user.email = 'p2@p.pp'
    user.password = 'paspas'
    user.first_name = 'Imie2'
    user.last_name = 'Nazwisko2'
    user.pesel = '12345678902'
    user.address = 'Ulica 2'
    user.postal_code = '00-002'
    user.city = 'Miasto 2'
    user.type = 'Patient'
    user.save!
    user.confirm!
    user.add_role :patient
  
    user = User.new
    user.email = 'd1@d.dd'
    user.password = 'paspas'
    user.first_name = 'Imie1'
    user.last_name = 'Nazwisko1'
    user.pzw = '0000001'
    user.type = 'Doctor'
    user.save!
    user.confirm!
    user.add_role :doctor
    
    user = User.new
    user.email = 'd2@d.dd'
    user.password = 'paspas'
    user.first_name = 'Imie2'
    user.last_name = 'Nazwisko2'
    user.pzw = '0000002'
    user.type = 'Doctor'
    user.save!
    user.confirm!
    user.add_role :doctor
  end

  def down
    for u in 2..5
      user = User.find(u)
      user.destroy
    end
  end
end
