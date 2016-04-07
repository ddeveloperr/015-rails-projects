class ContactMailer < ActionMailer::Base
    default to: 'ddeveloperr@gmail.com'
    
    # This method pull all info from form
    def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
    
    
    mail(from: email, subject: 'Contact Form Message')
    end
    
end
