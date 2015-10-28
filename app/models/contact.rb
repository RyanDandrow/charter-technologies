class Contact < ActiveRecord::Base

	acts_as_commentable

	belongs_to :user
	has_many :comments

end