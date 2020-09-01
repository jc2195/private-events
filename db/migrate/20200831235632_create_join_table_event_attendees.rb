class CreateJoinTableEventAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendees, id: false do |t|
      t.integer :attended_event_id
      t.integer :event_attendee_id
    end

    add_index :event_attendees, :attended_event_id
    add_index :event_attendees, :event_attendee_id
  end
end
