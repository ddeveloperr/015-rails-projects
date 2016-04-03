class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        ## Received all details from form and save it
        if @contact.save
            
            # pull this info from form using params hash in practical life
            # For details take a look at rails log, after hitt submitt btn
            # "contact"=>{"name"=>"Test_parrams_from_form", "email"=>"", "comments"=>""}, "commit"=>"Submit"}
            
            name = params[:contact][:name] 
            email = params[:contact][:email]
            body = params[:contact][:comments]
            
            # there we reffering to the mailers/contact_mailer.rb
            # Hay Rails RUN contact_email method please,
            # I pass arguments name, email, body to contact_email method
            # Then call Rails deliver method
            ContactMailer.contact_email(name, email, body).deliver
            # method is running
            # Now, evaluate true and get us success message
            flash[:success] = "Message sent"
            # then redirect to 
            redirect_to new_contact_path
        else
            # if there some errors, it's not save, it's evaluate false provide to us error message
            flash[:danger] = "Error occurd, message has not been sent!"
            # redirect us to
            redirect_to new_contact_path
        end
    end
    
    
    
    private 
      # The params come from the user's browser when they request the page.
      def contact_params
          # Called as white list, it improved rails security
          # More details for params http://stackoverflow.com/questions/6885990/rails-params-explained
          
          # Tou can filter parameter which 
          params.require(:contact).permit(:name, :email, :commands)
      end
end
    
        