# frozen_string_literal: true

require 'date'
require_relative 'event_class'
# class to handle multiple events info on same date
def take_info
  puts 'Please eneter title of your event:'
  print 'Title:'
  @title = gets.chomp
  puts 'Please enter description of your event:'
  print 'Description:'
  @description = gets.chomp
end

def event_exist(date)
  count = 0
  while count < @event_record[date].length
    if @event_record[date][count] == @title && @event_record[date][count + 1] == @description
      return false
    end
    count += 2
  end
  return true
end

def add_multiple_events(date, name, desc)
  @event_record.each do |key, value|
    if key == date
      # array_event = []
      # array_event[0] = name
      # array_event[1] = desc
      value << name
      value << desc
      @event_record[key] = value
      puts 'Event has been added'
      return 'Event has been added'
    end
  end
  @event_record[date] = name, desc
  p 'Event has been added'
end

def remove_multiple_events(date)
  puts 'Please eneter title of your event:'
  print 'Title:'
  @title = gets.chomp
  puts 'Please enter description of your event:'
  print 'Description:'
  @description = gets.chomp
  count = 0
  while count < @event_record[date].length
    if @event_record[date][count] == @title && @event_record[date][count + 1] == @description
      @event_record[date].delete_at(count)
      @event_record[date].delete_at(count)
    else
      count += 2
    end
  end
  if event_exist(date) == true
    print "No event of this title/description have been booked on this date\n\n"
  else
    p 'Event has been removed'
  end
end

def update_multiple_events(date)
  puts "      ----------You have #{@event_record[date].length / 2} events on #{date}--------------"
  puts 'Please enter title of event you want to update:'
  print 'Title:'
  title = gets.chomp
  puts 'Please enter description of event you want to update'
  print 'Description:'
  description = gets.chomp
  count = 0
  while count < @event_record[date].length
    if @event_record[date][count] == title && @event_record[date][count + 1] == description
      print 'Please enter updation title:'
      title = gets.chomp
      print 'Please enter updation description:'
      description = gets.chomp
      @event_record[date][count] = title
      @event_record[date][count + 1] = description
    end
    count += 2
  end
  if event_exist(date) == true
    print "No event of this title/description have been booked on this date\n\n"
  else
    p 'Event has been updated'
  end
end

def detail_events(date)
  count = 0
  #puts "       ----------------You have #{events} event/events on #{date} date-----------------"
  while count < @event_record[date].length
    puts "         Date of your event is:#{date}".brown
    puts "         Title of your event is:#{@event_record[date][count]}".light_blue
    puts "         Description of your event is:#{@event_record[date][count + 1]}".red
    count += 2
  end
end
