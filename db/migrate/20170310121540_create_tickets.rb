class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description

      t.timestamps :created_at
      t.timestamps :updated_at
      
    end
  end
end
