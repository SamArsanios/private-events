class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.text :event_description
      t.string :location

      t.timestamps
    end
  end
end
