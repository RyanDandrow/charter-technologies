class Contact < ActiveRecord::Base

	validates :full_name, presence: true

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