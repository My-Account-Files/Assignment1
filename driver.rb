# frozen_string_literal: true

require 'date'
require_relative 'calendar'
calendar = Calendar.new
calendar.display_calendar
event_date=0
while event_date != 7
  puts 'Enter 1 to book an event'
  puts 'Enter 2 to update an existing event'
  puts 'Enter 3 to delete an event'
  puts 'Enter 4 to view event against specific date'
  puts 'Enter 5 to view monthly events report'
  puts 'Enter 6 if you want to see monthly events in calendar view'
  puts 'Enter 7 if you want to do nothing'
  event_date = gets.chomp
  event_date = event_date.to_i
  if event_date == 1
    puts 'Please choose event date from given calander'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    puts 'Please Specify title for your event'
    print 'Title:'
    event_title = gets.chomp
    puts 'Please enter description of your event'
    print 'Description:'
    event_description = gets.chomp
    puts '     ***Thank you for evaluating information about your event***'
    puts "\n"
    calendar.add_event(event_day, event_title, event_description)
  end
  if event_date == 2
    puts 'Please enter date whose event to be change'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    calendar.update_event(event_day)
  end
  if event_date == 3
    puts 'Enter Date to delete event of specific date'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    calendar.remove_event(event_day)
  end
  if event_date == 4
    puts 'Enter date to view event details'
    print 'Date:'
    event_day = gets.chomp
    event_day = event_day.to_i
    calendar.detail_specific_date(event_day)
  end
  if event_date == 5
    puts '        -------------Detail of monthly events-----------------'
    calendar.month_detail
  end
  if event_date == 6
    puts '             -------------Monthly events in form of calendar is----------------'
    calendar.month_view
  end
end
