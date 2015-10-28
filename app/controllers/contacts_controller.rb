class ContactsController < ApplicationController

	def index
		@page_title = 'Contacts'
		@contacts = Contact.all
	end

	def show
		@page_title = 'View contact'
		@contact = Contact.find params[:id]
		@comments = @contact.comment_threads.order('created_at desc')
    	@new_comment = Comment.build_from(@contact, current_user.id, "")
	end

	def new
		@page_title = 'Create a new contact'
		@contact = Contact.new
	end

	def create
		@contact = Contact.new contact_params

		if @contact.save
			flash[:notice] = 'Contact successfully created'
			redirect_to contacts_path
		else
			flash.now[:warning] = 'There was a problem trying to create a new contact'
			render :action => :new
		end
	end

	def update
		@page_title = 'Update contact'
		@contact = Contact.find params[:id]

		if @contact.update_attributes contact_params
			flash[:notice] = 'Contact has been successfully updated'
			redirect_to contacts_path
		else
			flash.now[:warning] = 'There was a problem trying to update this contact'
			render :action => :new
		end
	end

	def destroy
		@contact = Contact.find params[:id]

		@contact.destroy
		flash[:notice] = 'Contact was successfully deleted'
		redirect_to contacts_path
	end

	private

		def contact_params
			params.require(:contact).permit(:company, :goes_by, :cell_phone, :sf_id, :additional_info, :tax_id, :drivers_license,
											:spouse_goes_by, :date_of_birth, :spouse_date_of_birth, :alt_phone_1, :alt_phone_2,
											:alt_phone_3, :alt_phone_4, :alt_phone_1_place, :alt_phone_2_place, :alt_phone_3_place,
											:alt_phone_4_place)
		end
end