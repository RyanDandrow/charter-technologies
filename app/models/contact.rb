class Contact < ActiveRecord::Base

	before_validation :capitalize_name

	validates_uniqueness_of :name, scope: [:middle_name, :last_name, :name_suffix]
	validates_presence_of(:name, :last_name)
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :spouse_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :alt_email, :allow_blank => true, format: { with: EMAIL_REGEX }

	acts_as_commentable

	belongs_to :user
	has_many :comments

	def full_name
	  [name, middle_name, last_name, name_suffix].join(' ')
	end

	def spouse_full_name
	  [spouse_first_name, spouse_middle_name, spouse_last_name].join(' ')
	end

	private

		def capitalize_name
		  self.name = self.name.capitalize if self.name.present?
		  self.middle_name = self.middle_name.capitalize if self.middle_name.present?
		  self.last_name = self.last_name.capitalize if self.last_name.present?
		end

end
