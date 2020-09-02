class AttendeeEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendee do |t|
      t.integer :attended_event_id
      t.integer :event_attendee_id
    end

    add_index :event_attendee, :attended_event_id
    add_index :event_attendee, :event_attendee_id
  end
end
