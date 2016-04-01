class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        ## Received all details from form and save it
        if @contact.save
            # evaluate true and get us success message
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
    
        