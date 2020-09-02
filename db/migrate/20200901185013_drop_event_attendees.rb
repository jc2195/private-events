class DropEventAttendees < ActiveRecord::Migration[6.0]
  def change
    drop_table(:event_attendees)
  end
end
