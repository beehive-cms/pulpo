class CreateBeehivePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :beehive_preferences do |t|
      t.text :value
      t.string :key

      t.timestamps
    end
    add_index :beehive_preferences, :key, unique: true
  end
end
