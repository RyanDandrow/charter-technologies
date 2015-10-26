require 'authlogic'
require 'securerandom'

namespace :users do

  desc "Create first admin user"
  task create_admin: :environment do

    raise "Usage: specify email address, e.g. rake [task] email=mail@example.com [(optional) password=mypassword]" unless ENV.include?("email")
    password = ENV['password'] || SecureRandom.hex
    admin = AdminUser.new({ name: 'Admin', email: ENV['email'], access_level: $USER_ACCESS_LEVEL_ADMIN, password: password, password_confirmation: password })

    unless admin.save
      puts "Failed: check that the 'admin' account doesn't already exist."
    else
      puts "Created new admin user with username 'admin' and password '#{password}'"
    end
  end

  desc "Remove all users"
  task remove_all: :environment do
    users = AdminUser.all
    num_users = users.size
    users.destroy_all
    puts "Removed #{num_users} user(s)"
  end

end
