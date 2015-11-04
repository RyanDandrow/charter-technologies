class Contact < ActiveRecord::Base

	validates_uniqueness_of :first_name, scope: [:middle_name, :last_name, :name_suffix], :uniqueness => { :case_sensitive => false }, presence: :true
	validates_presence_of(:first_name, :last_name)
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :spouse_email, :allow_blank => true, format: { with: EMAIL_REGEX }
	validates :alt_email, :allow_blank => true, format: { with: EMAIL_REGEX }

	acts_as_commentable

	belongs_to :user
	has_many :comments

	def full_name
	  [first_name, middle_name, last_name, name_suffix].join(' ')
	end

	def spouse_full_name
	  [spouse_first_name, spouse_middle_name, spouse_last_name].join(' ')
	end

end
