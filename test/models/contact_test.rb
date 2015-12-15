require 'test_helper'

class ContactTest < ActiveSupport::TestCase

	def setup
		@contact = Contact.new(
						name: "Ryan", 
						last_name: "Dandrow",
						email: "ryandandrow@gmail.com",
						cell_phone: "609-312-6771")
	end

	test "name should be present" do
		@contact.name = " "
		assert_not @contact.valid?
	end

	test "last name should be present" do
		@contact.last_name = " "
		assert_not @contact.valid?
	end

  test "last_name should be unique" do
    duplicate_contact = @contact.dup
    assert_not duplicate_contact.valid?
  end

	test "email addresses should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.email = @contact.email.upcase
		@contact.save
		assert_not duplicate_contact.valid?
  end

	test "Spouse email addresses should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.spouse_email = @contact.spouse_email
		@contact.save
		assert_not duplicate_contact.valid?
  end

	test "cell phone should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.cell_phone = @contact.cell_phone
		@contact.save
		assert_not duplicate_contact.valid?
  end

	test "home phone should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.home_phone = @contact.home_phone
		@contact.save
		assert_not duplicate_contact.valid?
  end

	test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com contact_at_foo.org contact.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
    		@contact.email = invalid_address
    		assert_not @contact.valid?, "#{invalid_address.inspect} should be invalid"
  	end
	end

	test "cell phone should reject invalid number" do
  	invalid_number = %w[609-32-6771 60-000-4444 609-312-000]
  	invalid_number.each do |invalid_number|
    		@contact.cell_phone = invalid_number
    		assert_not @contact.valid?, "#{invalid_number.inspect} should be invalid"
  	end
	end

	test "home phone should reject invalid number" do
  	invalid_number = %w[609-32-6771 60-000-4444 609-312-000]
  	invalid_number.each do |invalid_number|
    		@contact.home_phone = invalid_number
    		assert_not @contact.valid?, "#{invalid_number.inspect} should be invalid"
  	end
	end

	test "SF ID should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.sf_id = @contact.sf_id
		@contact.save
		assert_not duplicate_contact.valid?
	end

	test "Tax ID should be unique" do
		duplicate_contact = @contact.dup
		duplicate_contact.tax_id = @contact.tax_id
		@contact.save
		assert_not duplicate_contact.valid?
	end

end
