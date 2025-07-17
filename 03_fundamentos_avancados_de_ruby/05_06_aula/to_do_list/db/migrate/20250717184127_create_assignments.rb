class CreateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 10
      t.datetime :delete_date
      t.datetime :due_date

      t.timestamps
    end
  end
end
