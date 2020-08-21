# frozen_string_literal: true

require 'date'
require_relative 'event_class'
require_relative 'multiple_events'
require_relative 'integer_class'
# Calendar class to handle all details about event and to display calendar
class Calendar

  def initialize
    event = Event.new
    @event_record = {}
  end
  private

  def take_info
    puts 'Please eneter title of your event:'
    print 'Title:'
    @title = gets.chomp
    puts 'Please enter description of your event:'
    print 'Description:'
    @description = gets.chomp
  end

  def display_event(date)
    puts "         Date of your event is:#{date}"
    puts "         Title of your event is:#{@event_record[date][0]}"
    puts "         Description of your event is:#{@event_record[date][1]}"
  end

  public

  def add_event(date, name, desc)
    if @event_record.empty?
      @event_record[date] = name, desc
    else
      add_multiple_events(date, name, desc)
    end
    p @event_record
  end

  def remove_event(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n"
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n"
      puts "                Enter 1 if you want to book event               \n\n"
    elsif @event_record[date].first.is_a?(Array)
      remove_multiple_events(date)
    else
      @event_record.delete(date)
    end
  end

  def update_event(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n"
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n"
    elsif @event_record[date].first.is_a?(Array)
      update_multiple_events(date)
    else
      take_info
      @event_record[date] = @title, @description
    end
  end

  def detail_specific_date(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n"
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n"
    elsif @event_record[date].first.is_a?(Array)
      detail_events(date)
    else
      display_event(date)
    end
  end

  def month_detail
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n"
    elsif
      @event_record.each do |key, value|
        if value[0].is_a?(Array)
          detail_events(key)
        else
          display_event(key)
        end
      end
    end
  end

  def display_calendar
    print "                         August 2020   \n"
    print "                     -----------------\n"
    print "          SAT    SUN    MON    TUE    WED    THU    FRI\n"
    print "        ----------------------------------------------------\n"
    date = Date.parse('01/08/2020')
    print '           '
    count = 1
    while date < Date.parse('2020-09-01')
      if date.day.num_digits == 1
        print "#{date.day}      "
      elsif date.day.num_digits == 2
        print "#{date.day}     "
      end
      date += 1
      count += 1
      if count == 8
        print "\n           "
        count = 1
      end
    end
    print "\n\n"
  end

  def month_view
    print "                         August 2020   \n"
    print "                     -----------------\n"
    print "          SAT    SUN    MON    TUE    WED    THU    FRI\n"
    print "        ----------------------------------------------------\n"
    date = Date.parse('01/08/2020')
    print '           '
    count = 1
    while date < Date.parse('2020-09-01')
      if date.day.num_digits == 1 && @event_record.key?(date.day)
        print "#{date.day}(#{@event_record[date.day].length}) "
      elsif date.day.num_digits == 1
        print "#{date.day}      "
      elsif date.day.num_digits == 2 && @event_record.key?(date.day)
        print "#{date.day}(#{@event_record[date.day].length})"
      elsif date.day.num_digits == 2
        print "#{date.day}     "
      end
      date += 1
      count += 1
      if count == 8
        print "\n           "
        count = 1
      end
    end
    print "\n\n"
  end
end
