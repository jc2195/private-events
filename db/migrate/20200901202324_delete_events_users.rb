class DeleteEventsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table(:events_users)
  end
end
