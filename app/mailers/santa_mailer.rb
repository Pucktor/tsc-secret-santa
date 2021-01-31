class SantaMailer < ApplicationMailer
    default from: 'paul.heilweck@edu.escp.eu'

    def match_result(match)
        @match = match
        subject = "#{@match.event.title} - #{@match.giver.name}"
        mail(to: @match.giver.email, subject: subject)
    end
end
