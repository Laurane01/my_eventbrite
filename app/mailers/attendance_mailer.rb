class AttendanceMailer < ApplicationMailer

	default from: 'no-reply@monsite.fr'

	def participation_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance= attendance 
    puts "je suis dans le mailer"

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://eventbrite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.user.email, subject: 'Bienvenue chez nous !') 
end

end
