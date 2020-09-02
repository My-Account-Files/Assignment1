# frozen_string_literal: true

require 'date'
require_relative 'calendar'
require_relative 'colorize'
def validate_date(string)
  begin
    if(Date.iso8601(string))
      false
    end
  rescue ArgumentError
    true
  end
end

def take_input
  print 'Enter number of month (ranges from 1 to 12):'.red.bold
  month = gets.chomp
  month = month.to_i
  while month <= 0 || month > 12
    print 'Please enter valid month number(ranges from 1 to 12):'.yellow.bold
    month = gets.chomp
    month = month.to_i
  end
  print 'Enter Year for calendar display(e.g 2020):'.blue.bold
  year = gets.chomp
  year = year.to_i
  while year <= 999 || year > 9999
    print 'Please enter valid year of 4 digits(e.g 2020):'.pink.bold
    year = gets.chomp
    year = year.to_i
  end
  return month, year
end
calendar = Calendar.new
event_date = 0
puts '------------Please provide valid month number and year to view calendar--------------'.green.bold
month, year = take_input
calendar.display_calendar(month, year)
while event_date != 7
  puts 'Enter 1 to book an event'.cyan.bold.italic
  puts 'Enter 2 to update an existing event'.cyan.bold.italic
  puts 'Enter 3 to delete an event'.cyan.bold.italic
  puts 'Enter 4 to view event against specific date'.cyan.bold.italic
  puts 'Enter 5 to view monthly events report'.cyan.bold.italic
  puts 'Enter 6 if you want to see monthly events in calendar view'.cyan.bold.italic
  puts 'Enter 7 if you want to do nothing'.cyan.bold.italic
  event_date = gets.chomp
  event_date = event_date.to_i
  if event_date == 1
    puts 'Please choose event date from given calander(format:YYYY-MM-DD)'.yellow
    print 'Date:'.yellow
    event_day = gets.chomp
    while !validate_date(event_day) == false
      print 'Please enter valid date:'.yellow
      event_day = gets.chomp
    end
    puts event_day
    puts 'Please Specify title for your event'.blue
    print 'Title:'.blue
    event_title = gets.chomp
    puts 'Please enter description of your event'.green
    print 'Description:'.green
    event_description = gets.chomp
    puts '     ***Thank you for evaluating information about your event***'.magenta.bold.italic
    puts "\n"
    calendar.add_event(event_day, event_title, event_description)
  end
  if event_date == 2
    puts 'Please enter date whose event to be change(format:YYYY-MM-DD)'.yellow
    print 'Date:'.yellow
    event_day = gets.chomp
    while !validate_date(event_day) == false
      print 'Please enter valid date:'.pink
      event_day = gets.chomp
    end
    calendar.update_event(event_day)
  end
  if event_date == 3
    puts 'Enter Date to delete event of specific date(format:YYYY-MM-DD)'.yellow
    print 'Date:'.yellow
    event_day = gets.chomp
    while !validate_date(event_day) == false
      print 'Please enter valid date:'.yellow
      event_day = gets.chomp
    end
    calendar.remove_event(event_day)
  end
  if event_date == 4
    puts 'Enter date and month to view event details (format:YYYY-MM-DD)'.green
    print 'Date:'.yellow
    event_day = gets.chomp
    while !validate_date(event_day) == false
      print 'Please enter valid date:'.yellow
      event_day = gets.chomp
    end
    calendar.detail_specific_date(event_day)
  end
  if event_date == 5
    puts "\nPlease enter valid month number and year to view monthly report of events\n".yellow
    month, year = take_input
    puts '        -------------Detail of monthly events-----------------'.magenta.bold
    calendar.month_detail(month, year)
  end
  if event_date == 6

    puts '------------Please provide valid month number and year to view events in calendar form--------------'.yellow
    month, year = take_input
    calendar.month_view(month, year)
  end
end
