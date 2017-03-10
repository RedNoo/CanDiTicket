class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
