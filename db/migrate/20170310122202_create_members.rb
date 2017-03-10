class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email
      t.string :password

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
