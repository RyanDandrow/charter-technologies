require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase

	def setup
		@admin_user = AdminUser.new(
						name: "Ryan Dandrow", 
						email: "ryandandrow@gmail.com",
						password: "password",
						password_confirmation: "password")
	end

	test "name should be present" do
		@admin_user.name = " "
		assert_not @admin_user.valid?
	end

	test "name should be unique" do
		duplicate_contact = @admin_user.dup
		duplicate_contact.email = @admin_user.email.upcase
		@admin_user.save
		assert_not duplicate_contact.valid?
  end

  test "email should be present" do
		@admin_user.email = " "
		assert_not @admin_user.valid?
	end

	test "email addresses should be unique" do
		duplicate_contact = @admin_user.dup
		duplicate_contact.email = @admin_user.email.upcase
		@admin_user.save
		assert_not duplicate_contact.valid?
  end

	test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com contact_at_foo.org admin_user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
    		@admin_user.email = invalid_address
    		assert_not @admin_user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
	end

  	test "password should be present (nonblank)" do
    	@admin_user.password = @admin_user.password_confirmation = " " * 6
    	assert_not @admin_user.valid?
  	end

end
