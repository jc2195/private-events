class DropEventAttendee < ActiveRecord::Migration[6.0]
  def change
    drop_table(:event_attendee)
  end
end
