class CreateBeehiveRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :beehive_roles do |t|
      t.string :name

      t.timestamps
    end
    add_index :beehive_roles, :name, unique: true
  end
end
