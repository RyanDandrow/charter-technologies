class Contact < ActiveRecord::Base

	before_validation :capitalize_name

	validates_uniqueness_of :name, scope: [:middle_name, :last_name, :name_suffix]
	validates_presence_of(:name, :last_name)
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :spouse_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :alt_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates_length_of :date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	validates_length_of :spouse_date_of_birth, :minimum => 10, :maximum => 10, :allow_blank => true, message: "is invalid"
	validates_length_of :tax_id, :minimum => 10, :maximum => 10, :allow_blank => true, message: "ID is invalid"
	validates :company_type, presence: true
	

	acts_as_commentable

	belongs_to :user
	has_many :comments

	def full_name
	  [name, middle_name, last_name, name_suffix].join(' ')
	end

	def spouse_full_name
	  [spouse_first_name, spouse_middle_name, spouse_last_name].join(' ')
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

	private

		def capitalize_name
		  self.name = self.name.capitalize if self.name.present?
		  self.middle_name = self.middle_name.capitalize if self.middle_name.present?
		  self.last_name = self.last_name.capitalize if self.last_name.present?
		  self.goes_by = self.goes_by.capitalize if self.goes_by.present?
		  self.spouse_goes_by = self.spouse_goes_by.capitalize if self.spouse_goes_by.present?
		end

end
