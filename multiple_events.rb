# frozen_string_literal: true

require 'date'
require_relative 'event_class'
# class to handle multiple events info on same date

def add_multiple_events(date, name, desc)
  @event_record.dup.each do |key, value|
    if key == date
      array_event = []
      array_event[0] = name
      array_event[1] = desc
      @event_record[key] = value, array_event
    else
      @event_record[date] = name, desc
    end
  end
end

def remove_multiple_events(date)
  take_info
  count = 0
  while count < @event_record[date].length
    if @event_record[date][count][0] == @title && @event_record[date][count][1] == @description
      @event_record[date].delete_at(count)
    end
    count += 1
  end
  p @event_record
end

def update_multiple_events(date)
  puts "      ----------You have #{@event_record[date].length} events on #{date}--------------"
  puts 'Please enter title of event you want to update:'
  print 'Title:'
  title = gets.chomp
  puts 'Please enter description of event you want to update'
  print 'Description:'
  description = gets.chomp
  count = 0
  while count < @event_record[date].length
    if @event_record[date][count].first == title && @event_record[date][count][1] == description
      take_info
      @event_record[date][count] = @title, @description
    end
    count += 1
  end
end

def detail_events(date)
  count = 0
  puts "       ----------------You have #{@event_record[date].length} events on #{date} date-----------------"
  while count < @event_record[date].length
    puts "Date of event is:#{date}"
    puts "Event title:#{@event_record[date][count][0]}"
    puts "Event Description is:#{@event_record[date][count][1]}"
    count += 1
  end
end
