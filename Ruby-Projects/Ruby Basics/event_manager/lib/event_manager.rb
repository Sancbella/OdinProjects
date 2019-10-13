require "csv" 
require 'google/apis/civicinfo_v2'
require 'erb'
# template_letter = File.read "form_letter.erb"
# erb_template = ERB.new template_letter

$daySignUp = []
$hourSignUp = []
def clean_phone(phone)
    phone = phone.gsub!(/[^0-9]/,'').to_s
    if phone.length == 10
        phone = phone.to_s
    elsif phone.length == 11 && phone[0] == 1 
        phone = phone.slice![1..11]
    elsif phone.length == 11 && phone[0] != 1 || phone.length > 11 || phone.length < 10 
        phone = 'Invalid Number'
    end
end
def time_target(time)
  time = DateTime.strptime(time.to_s, '%m/%d/%Y %H:%M')
  stripped_hours = time.strftime('%H')
  
  $hourSignUp << stripped_hours
  day_target(time)
end
def day_target(time)
  $daySignUp << Date.new(2008,time.mon,time.day).wday
end

        
# If the phone number is less than 10 digits assume that it is a bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

def clean_zip(zip)
    zip.to_s.rjust(5,'0')[0..4]
    # ^ all of that goes into this one line
    # if zip.nil? then 
    #     zip = '00000'
    #     elsif zip.length == 5 then 
    #     zip
    #     elsif zip.length > 5 then 
    #     zip = zip.slice[0..4]
    #     elsif zip.length < 5
    #         zip = zip.rjust 5, '0'
    # end
end
def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
    begin
      civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
      ).officials
    rescue
      "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
  end
# def save_letter(id, form_letter)
#     Dir.mkdir("output") unless Dir.exists? "output"
#     filename = "output/thanks_#{id}.html"
#     File.open(filename,'w') do |file|
#     file.puts form_letter
#     end
# end
puts "EventManager Initialized!"
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol 
contents.each do |row|
    id = row[0]
    phone = clean_phone(row[:homephone])
    name = row[:first_name]
    zip = clean_zip(row[:zipcode])
    name.capitalize!
    time = time_target(row[:regdate])

    # legislators = legislators_by_zipcode(zip) 
    # form_letter = erb_template.result(binding)
    # save_letter(id, form_letter)

#   p columns
#   puts 
end
for i in 01...24 do 
  i = "%02d" % i
  puts "Hour #{i} had #{$hourSignUp.count(i)} signups" 
end
for i in 0...6 do puts "Day #{i} had #{$daySignUp.count(i)} signups" end
