class EventAttendee < ApplicationRecord
    validates_uniqueness_of :attended_event, scope: [:event_attendee_id]
    belongs_to :event_attendee, class_name: 'User'
    belongs_to :attended_event, class_name: 'Event'
end
