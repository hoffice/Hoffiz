class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :space, index: true
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.boolean :live
      t.boolean :coffee
    end
    add_foreign_key :events, :spaces
  end
end
