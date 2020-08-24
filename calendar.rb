# frozen_string_literal: true

require 'date'
require 'rspec/autorun'
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
    p @event_record

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

  def display_calendar(month_name, year_name)
    date = Date.parse("01/#{month_name}/#{year_name}")
    print '           '
    count = 1
    date1 = Date.strptime("#{year_name}-#{month_name}-01", '%Y-%m-%d').strftime('%B %Y')
    print "                 #{date1}   \n"
    print "                     -----------------\n"
    print "          SAT    SUN    MON    TUE    WED    THU    FRI\n"
    print "        ----------------------------------------------------\n"
    print '           '
    if(date.saturday?)
      print "#{date.day}      "
    elsif date.sunday?
      print "       #{date.day}      "
    elsif date.monday?
      print "              #{date.day}      "
    elsif date.tuesday?
      print "                     #{date.day}      "
    elsif date.wednesday?
      print "                            #{date.day}      "
    elsif date.thursday?
      print "                                   #{date.day}      "
    elsif date.friday?
      print "                                          #{date.day}      "
    end
    date += 1
    while date < Date.parse("01/#{month_name + 1}/#{year_name}")
      if date.saturday? && date.day.num_digits == 1
        print "\n           #{date.day}      "
      elsif date.saturday? && date.day.num_digits == 2
        print "\n           #{date.day}     "
      elsif date.day.num_digits == 1
        print "#{date.day}      "
      elsif date.day.num_digits == 2
        print "#{date.day}     "
      end
      date += 1
    end
    print "\n\n"
  end

  def month_view(month_name, year_name)
    date = Date.parse("01/#{month_name}/#{year_name}")
    print '           '
    date1 = Date.strptime("#{year_name}-#{month_name}-01", '%Y-%m-%d').strftime('%B %Y')
    print "                 #{date1}   \n"
    print "                     -----------------\n"
    print "          SAT    SUN    MON    TUE    WED    THU    FRI\n"
    print "        ----------------------------------------------------\n"
    print '           '
    if(@event_record.empty?)
      if(date.saturday?)
        print "#{date.day}      "
      elsif date.sunday?
        print "       #{date.day}      "
      elsif date.monday?
        print "              #{date.day}      "
      elsif date.tuesday?
        print "                     #{date.day}      "
      elsif date.wednesday?
        print "                            #{date.day}      "
      elsif date.thursday?
        print "                                   #{date.day}      "
      elsif date.friday?
        print "                                          #{date.day}      "
      end
    else
      if(date.saturday?)
        print "#{date.day}(#{@event_record[date.day].length}) "
      elsif date.sunday?
        print "       #{date.day}(#{@event_record[date.day].length}) "
      elsif date.monday?
        print "             #{date.day}(#{@event_record[date.day].length}) "
      elsif date.tuesday?
        print "                    #{date.day}(#{@event_record[date.day].length}) "
      elsif date.wednesday?
        print "                           #{date.day}(#{@event_record[date.day].length}) "
      elsif date.thursday?
        print "                                  #{date.day}(#{@event_record[date.day].length}) "
      elsif date.friday?
        print "                                         #{date.day}(#{@event_record[date.day].length}) "
      end
    end
    while date < Date.parse("02/#{month_name + 1}/#{year_name}")
      if date.saturday? && date.day.num_digits == 1 && @event_record.key?(date.day)
        print "\n           #{date.day}(#{@event_record[date.day].length}) "
      elsif date.saturday? && date.day.num_digits == 2 && @event_record.key?(date.day)
        print "\n           #{date.day}(#{@event_record[date.day].length})"
      elsif date.day.num_digits == 1 && @event_record.key?(date.day)
        print "#{date.day}(#{@event_record[date.day].length}) "
      elsif date.day.num_digits == 1
        print "#{date.day}      "
      elsif date.day.num_digits == 2 && @event_record.key?(date.day)
        print "#{date.day}(#{@event_record[date.day].length})"
      elsif date.day.num_digits == 2
        print "#{date.day}     "
      end
      date += 1
    end
    print "\n\n"
  end
end
describe Calendar do
  it 'Adds Event to calendar' do
    calendar_test = Calendar.new
    expect(calendar_test.add_event(03, 'Arifa', 'Hello')).to eq({ 3 => ['Arifa', 'Hello']})
  end
  it 'Adds Multiple events on same date' do
    calendar1_test = Calendar.new
    calendar1_test.add_event('3','Pakiza','Abid')
    expect(calendar1_test.send(:add_multiple_events, 3, 'Ruby', 'Language')).to eq({'3'=> ['Pakiza','Abid']})
  end
  it 'Removes Event from Calendar' do
    calendar2_test = Calendar.new
    calendar2_test.add_event(4,'Pakiza', 'Abid')
    expect(calendar2_test.remove_event(4)).to eq(['Pakiza', 'Abid'])
  end
  it 'Removes multiple events from calendar' do
    calendar3_test = Calendar.new
    calendar3_test.add_event(3,'Arifa', 'Abid')
    expect(calendar3_test.send(:remove_multiple_events, 3)).to eq(3 => ['Arifa', 'Abid'])
  end
  it 'Update Event in calendar' do
    calendar4_test = Calendar.new
    calendar4_test.add_event(3, 'Arifa', 'Abid')
    expect(calendar4_test.update_event(3)).to eq(['Arifa', 'Abid'])
  end
  it 'Update multiple events' do
    calendar4_test = Calendar.new
    calendar4_test.add_event(3, 'Arifa', 'Abid')
    calendar4_test.add_event(3, 'Pakiza', 'Abid')
    expect(calendar4_test.send(:update_multiple_events, 3)).to eq(3 => [['Arifa', 'Abid'], ['Pakiza', 'Abid']])
  end
end
