class Contact < ActiveRecord::Base

	before_validation :capitalize_name

	validates_uniqueness_of :name, scope: [:last_name, :name_suffix]
	validates_presence_of(:name, :last_name)
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :spouse_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :alt_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates_length_of :date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	validates_length_of :spouse_date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	validates_length_of :tax_id, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	validates_uniqueness_of :sf_id, allow_blank: true, message: "is already in use"
	validates_length_of :cell_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	validates_length_of :home_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	validates_length_of :spouse_cell_phone, :minimum => 14, :maximum => 14, :allow_blank => true, message: "is invalid"
	validates_length_of :company_phone, :minimum => 14, :maximum => 22, :allow_blank => true, message: "is invalid"


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

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv.add_row column_names
	    all.each do |contacts|
	      values = contacts.attributes.values
	      csv.add_row values
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
	end

	def self.assign_from_row(row)
		contact = Contact.where(name: row[:name], last_name: row[:last_name]).first_or_initialize
		contact.assign_attributes row.to_hash.slice(:name, :last_name, :email, :urg, :company, :company_type, :drivers_license)
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

	private

		def capitalize_name
		  self.name = self.name.capitalize if self.name.present?
		  self.last_name = self.last_name.capitalize if self.last_name.present?
		  self.goes_by = self.goes_by.capitalize if self.goes_by.present?
		  self.spouse_goes_by = self.spouse_goes_by.capitalize if self.spouse_goes_by.present?
		end

end
