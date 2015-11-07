class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
    @search = Contact.search(params[:q])
    @contacts = @search.result
	end

	def show
		@contact = Contact.find params[:id]
   	@search = Contact.search(params[:q])
   	@contacts = @search.result
		@comments = @contact.comment_threads.order('created_at desc')
   	@new_comment = Comment.build_from(@contact, current_user.id, current_user.name,  "")
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new contact_params

		if @contact.save
			flash[:notice] = 'Contact successfully created'
			redirect_to @contact
		else
			flash.now[:warning] = 'There was a problem trying to create a new contact'
			render :action => :new
		end
	end

	def update
		@contact = Contact.find params[:id]

		if @contact.update_attributes contact_params
			flash[:notice] = 'Contact has been successfully updated'
			redirect_to contact_path
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
											:alt_phone_4_place, :home_phone, :company_phone, :spouse_cell_phone, :first_name,
											:middle_name, :last_name, :name_suffix, :spouse_first_name, :spouse_middle_name,
											:spouse_last_name, :email, :spouse_email, :alt_email, :alt_email_label, :web_address,
											:county_box1, :county_box2, :county_box3, :county_box4, :notes_box1, :notes_box2,
											:notes_box3, :notes_box4, :company_type, :companyNameBox1, :contactNamesBox2,
											:additionalAddressBox3, :additionalAddressBox4, :ssn, :spouse_ssn, :urgent,
											:addressLinesBox1, :addressLinesBox2, :addressLinesBox3, :addressLinesBox4, :name)
		end
end