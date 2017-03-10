class CreateSlaPlans < ActiveRecord::Migration
  def change
    create_table :sla_plans do |t|
      t.string :title
      t.integer :responsetime

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
