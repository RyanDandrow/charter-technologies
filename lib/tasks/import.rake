require 'csv'

namespace :import do

  desc "Import contacts from CSV"
  task contacts: :environment do
    filename = File.join Rails.root, "contacts.csv"
    counter = 0

    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      contact = Contact.assign_from_row(row)
      if contact.save
        counter += 1
      else
        puts "#{} - #{contact.errors.full_messages.join(",")}"
      end
    end

    puts "Imported #{counter} contacts"
  end
end
