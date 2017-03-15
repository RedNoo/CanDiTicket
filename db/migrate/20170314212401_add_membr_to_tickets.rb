class AddMembrToTickets < ActiveRecord::Migration
  def change
    add_column  :tickets, :member_id , :integer
  end
end
