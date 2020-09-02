# frozen_string_literal: true

require 'date'
require_relative 'event_class'
require_relative 'multiple_events'
require_relative 'integer_class'
require_relative 'show_calendar'
# Calendar class to handle all details about event and to display calendar
class Calendar
  def initialize
    event = Event.new
    @event_record = {}
  end
  private

  def take_info
    puts 'Please eneter title of your event:'.red
    print 'Title:'
    @title = gets.chomp
    puts 'Please enter description of your event:'.yellow
    print 'Description:'
    @description = gets.chomp
  end

  def exist(month, year)
    @event_record.each do |key, value|
      calendar_year = key[0..3].to_i
      calendar_month = key[5..6].to_i
      if calendar_month == month && calendar_year == year
        return 0
      end
    end
    puts "       ***No event has been booked in this month***\n".brown.bold.italic
  end

  def display_event(date)
    puts "         Date of your event is:#{date}".brown
    puts "         Title of your event is:#{@event_record[date][0]}".light_blue
    puts "         Description of your event is:#{@event_record[date][1]}".red
  end

  public

  def add_event(date, name, desc)
    if @event_record.empty?
      @event_record[date] = name, desc
      p 'Event has been added'
    else
      add_multiple_events(date, name, desc)
    end
  end

  def remove_event(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n".green.bold.italic
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n".pink.bold.italic
      puts "                Enter 1 if you want to book event               \n\n".magenta.bold.italic
    elsif @event_record[date].length > 2
      remove_multiple_events(date)
    else
      @event_record.delete(date)
      p 'Event has been removed'
    end
  end

  def update_event(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n".green.bold.italic
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n".red.bold.italic
    elsif @event_record[date].length > 2
      update_multiple_events(date)
    else
      take_info
      @event_record[date] = @title, @description
      p 'Event has been updated'
    end
  end

  def detail_specific_date(date)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n".gray.bold.italic
    elsif !@event_record.key?(date)
      puts "      ----------No event on #{date} has been recorded-----------\n".yellow.bold.italic
    elsif @event_record[date].length > 2
      detail_events(date)
    else
      display_event(date)
    end
  end

  def month_detail(month, year)
    if @event_record.empty?
      puts "-----------No single Event has booked until now----------\n".red.bold.italic
    else
      @event_record.each do |key, value|
        calendar_year = key[0..3].to_i
        calendar_month = key[5..6].to_i
        if calendar_month == month && calendar_year == year
          detail_events(key)
        end
      end
    end
    exist(month, year)
  end

  def display_calendar(month_name, year_name)
    show_month_calendar(month_name, year_name)
  end

  def month_view(month_name, year_name)
    if @event_record.empty?
      print "          --------------------No single event has recorded-------------\n\n".blue.bold.italic
      return
    end
    next_month, next_year = 0
    puts "    -------------Monthly events in form of calendar is----------------\n\n".light_blue.bold.italic
    date = Date.parse("01/#{month_name}/#{year_name}")
    check = date.to_s
    print '           '
    date1 = Date.strptime("#{year_name}-#{month_name}-01", '%Y-%m-%d').strftime('%B %Y')
    print "                 #{date1}   \n".red.bold
    print "                        -----------------\n".green.bold
    print "          SAT    SUN    MON    TUE    WED    THU    FRI\n".red.bold
    print "        ----------------------------------------------------\n".green.bold
    print '           '
    if date.saturday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
    elsif date.saturday?
      print "#{date.day}      ".blue
    elsif date.sunday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "       #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.sunday?
      print "       #{date.day}      "
    elsif date.monday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "             #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.monday?
      print "              #{date.day}      ".blue
    elsif date.tuesday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "                    #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.tuesday?
      print "                     #{date.day}      ".blue
    elsif date.wednesday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "                           #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.wednesday?
      print "                            #{date.day}      ".blue
    elsif date.thursday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "                                  #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.thursday?
      print "                                   #{date.day}      ".blue
    elsif date.friday? && @event_record.key?(check)
      if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
        print "#{date.day}(#{@event_record[check].length / 2}) ".blue
      end
      print "                                         #{date.day}(#{@event_record[check].length / 2}) ".blue
    elsif date.friday?
      print "                                          #{date.day}      ".blue
    end
    date += 1
    check = date.to_s
    if month_name == 12
      next_month = 1
      next_year = year_name + 1
    else
      next_month = month_name + 1
      next_year = year_name
    end
    while date < Date.parse("01/#{next_month}/#{next_year}")
      if date.saturday? && date.day.num_digits == 1 && @event_record.key?(check)
        if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
          print "#{date.day}(#{@event_record[check].length / 2}) ".blue
        end
        print "\n           #{date.day}(#{@event_record[check].length / 2}) ".blue
      elsif date.saturday? && date.day.num_digits == 1
        print "\n           #{date.day}      ".blue
      elsif date.saturday? && date.day.num_digits == 2 && @event_record.key?(check)
        if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
          print "#{date.day}(#{@event_record[check].length / 2}) ".blue
        end
        print "\n           #{date.day}(#{@event_record[check].length / 2})  ".blue
      elsif date.saturday? && date.day.num_digits == 2
        print "\n           #{date.day}     ".blue
      elsif date.day.num_digits == 1 && @event_record.key?(check)
        if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
          print "#{date.day}(#{@event_record[check].length / 2}) ".blue
        end
        print "#{date.day}(#{@event_record[check].length / 2})    ".blue
      elsif date.day.num_digits == 1
        print "#{date.day}      ".blue
      elsif date.day.num_digits == 2 && @event_record.key?(check)
        if @event_record[check][6] == month_name && @event_record[check][0..3] == year_name
          print "#{date.day}(#{@event_record[check].length / 2}) ".blue
        end
        print "#{date.day}(#{@event_record[check].length / 2})  ".blue
      elsif date.day.num_digits == 2
        print "#{date.day}     ".blue
      end
      date += 1
      check = date.to_s
    end
    print "\n\n"
  end
end
