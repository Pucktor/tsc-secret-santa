class Event < ApplicationRecord
    validates :title, presence: true
    has_many :participants
    has_many :matches

    def match_order
        participants = self.participants
        participants = participants.collect {|x| x}
        participants.shuffle!
        match = participants.zip(participants.rotate)
        return match
    end
end
