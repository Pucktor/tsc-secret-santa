class Match < ApplicationRecord
    belongs_to :event
    belongs_to :giver, :class_name => 'Participant'
    belongs_to :receiver, :class_name => 'Participant'

    def send_email
        SantaMailer.match_result(self).deliver_now
    end
end
