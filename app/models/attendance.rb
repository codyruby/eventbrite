class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    after_create_commit :welcome_event_send

    def welcome_event_send
      UserMailer.welcome_event_email(self.event, self.user).deliver_now
    end  

end
