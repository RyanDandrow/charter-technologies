class Contact < ActiveRecord::Base

	before_validation :capitalize_name

	validates_uniqueness_of :name, scope: [:last_name, :name_suffix]
	validates_presence_of(:name, :last_name)
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_uniqueness_of :email, allow_blank: true, format: { with: EMAIL_REGEX }
	validates_uniqueness_of :spouse_email, allow_blank: true, format: { with: EMAIL_REGEX }
	validates_uniqueness_of :sf_id, allow_blank: true, message: "is already in use"
	# validates :alt_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	# validates_length_of :date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	# validates_length_of :spouse_date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	# validates_length_of :tax_id, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	# validates_length_of :cell_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	# validates_length_of :home_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	# validates_length_of :spouse_cell_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	# validates_length_of :company_phone, :minimum => 14, :maximum => 22, :allow_blank => true, message: "is invalid"


	acts_as_commentable

	belongs_to :user
	has_many :comments

  has_many :comps
  accepts_nested_attributes_for :comps, reject_if: :all_blank, allow_destroy: true

	def full_name
	  [name, last_name, name_suffix].join(' ')
	end

	def spouse_full_name
	  [spouse_first_name, spouse_last_name].join(' ')
	end

  def self.to_csv
    attributes = %w{id company_label company company_type tax_id drivers_license_label drivers_license dl_state_select spouse_drivers_license_label spouse_drivers_license spouse_dl_state_select sf_id name last_name name_suffix goes_by ssn date_of_birth_label date_of_birth spouse_name_label spouse_first_name spouse_last_name spouse_goes_by spouse_ssn_label spouse_ssn spouse_date_of_birth_label spouse_date_of_birth cell_phone_label cell_phone spouse_cell_phone_label spouse_cell_phone company_phone_label company_phone home_phone_label home_phone alt_phone_1_place alt_phone_1 alt_phone_2_place alt_phone_2 alt_phone_3_place alt_phone_3 alt_phone_4_place alt_phone_4 address_box_1_label address_box_1 county_box1 address_box_2_label address_box_2 county_box2 address_box_3_label address_box_3 county_box3 address_box_4_label address_box_4 county_box4 email_label email spouse_email_label spouse_email web_address_label web_address alt_email_label alt_email additional_info_label additional_info urg created_at updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |contact|
        csv << attributes.map{ |attr| contact.send(attr) }
      end
    end
  end

	def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      contact = Contact.assign_from_row(row)
      if contact.save
        counter += 1
      else
        puts "#{} - #{contact.errors.full_messages.join(",")}"
      end
    end
    counter
	end

	def self.assign_from_row(row)
		contact = Contact.where(name: row[:name], last_name: row[:last_name]).first_or_initialize
		contact.assign_attributes row.to_hash.slice(:company_label, :company, :company_type, :tax_id, :drivers_license_label, :drivers_license, :dl_state_select, :spouse_drivers_license_label, :spouse_drivers_license, :spouse_dl_state_select, :sf_id, :name, :last_name, :name_suffix, :goes_by, :ssn, :date_of_birth, :spouse_name_label, :spouse_first_name, :spouse_last_name, :spouse_goes_by, :spouse_ssn_label, :spouse_ssn, :spouse_date_of_birth_label, :spouse_date_of_birth, :cell_phone_label, :cell_phone, :spouse_cell_phone_label, :spouse_cell_phone, :company_phone_label, :company_phone, :home_phone_label, :home_phone, :alt_phone_1_place, :alt_phone_1, :alt_phone_2_place, :alt_phone_2, :alt_phone_3_place, :alt_phone_3, :alt_phone_4_place, :alt_phone_4, :address_box_1_label, :address_box_1, :county_box1, :address_box_2_label, :address_box_2, :county_box2, :address_box_3_label, :address_box_3, :county_box3, :address_box_4_label, :address_box_4, :county_box4, :email_label, :email, :spouse_email_label, :spouse_email, :web_address_label, :web_address, :alt_email_label, :alt_email, :additional_info_label, :additional_info, :urg)
		contact
	end

	def correct_name
		if goes_by.blank?
			name
		else
			goes_by
		end
	end

	def spouse_correct_name
		if spouse_goes_by.blank?
			spouse_first_name
		else
			spouse_goes_by
		end
	end

	ransacker :whole_name do |parent|
	  Arel::Nodes::InfixOperation.new('||',
	    Arel::Nodes::InfixOperation.new('||',
	      parent.table[:name], Arel::Nodes.build_quoted(' ')
	    ),
	    parent.table[:last_name]
	  )
	end

		ransacker :spouse_whole_name do |parent|
	  Arel::Nodes::InfixOperation.new('||',
	    Arel::Nodes::InfixOperation.new('||',
	      parent.table[:spouse_first_name], Arel::Nodes.build_quoted(' ')
	    ),
	    parent.table[:spouse_last_name]
	  )
	end

 UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", "middle_initial", "spouse_middle_initial"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

	private

		def capitalize_name
		  self.name = self.name.capitalize if self.name.present?
		  self.last_name = self.last_name.capitalize if self.last_name.present?
		  self.goes_by = self.goes_by.capitalize if self.goes_by.present?
		  self.spouse_goes_by = self.spouse_goes_by.capitalize if self.spouse_goes_by.present?
		end

end
