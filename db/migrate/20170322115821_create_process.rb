class CreateProcess < ActiveRecord::Migration
  def change
    create_table :processes do |t|
      t.text :description
      t.integer :ticket_id
      t.integer :user_id
      t.integer :member_id
      
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
