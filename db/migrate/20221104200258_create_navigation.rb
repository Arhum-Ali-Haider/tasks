class CreateNavigation < ActiveRecord::Migration[6.1]
  def change
    create_table :navigations do |t|
      t.string :name, null: false
      t.integer :position

      t.timestamps
    end
  end
end
