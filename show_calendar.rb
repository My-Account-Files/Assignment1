# frozen_string_literal: true

require 'date'
require_relative 'event_class'
require_relative 'multiple_events'
require_relative 'integer_class'
require_relative 'colorize'
def show_month_calendar(month_name, year_name)
  date = Date.parse("01/#{month_name}/#{year_name}")
  print '           '
  date1 = Date.strptime("#{year_name}-#{month_name}-01", '%Y-%m-%d').strftime('%B %Y')
  print "               #{date1}   \n".red.bold
  print "                       ------------------\n".green.bold
  print "          SAT    SUN    MON    TUE    WED    THU    FRI\n".red.bold
  print "        ----------------------------------------------------\n".green.bold
  print '           '
  if date.saturday?
    print "#{date.day}      ".blue
  elsif date.sunday?
    print "       #{date.day}      ".blue
  elsif date.monday?
    print "              #{date.day}      ".blue
  elsif date.tuesday?
    print "                     #{date.day}      ".blue
  elsif date.wednesday?
    print "                            #{date.day}      ".blue
  elsif date.thursday?
    print "                                   #{date.day}      ".blue
  elsif date.friday?
    print "                                          #{date.day}      ".blue
  end
  date += 1
  next_month = 0
  next_year = 0
  if month_name == 12
    next_month = 1
    next_year = year_name + 1
  else
    next_month = month_name + 1
    next_year = year_name
  end
  while date < Date.parse("01/#{next_month}/#{next_year}")
    if date.saturday? && date.day.num_digits == 1
      print "\n           #{date.day}      ".blue
    elsif date.saturday? && date.day.num_digits == 2
      print "\n           #{date.day}     ".blue
    elsif date.day.num_digits == 1
      print "#{date.day}      ".blue
    elsif date.day.num_digits == 2
      print "#{date.day}     ".blue
    end
    date += 1
  end
  print "\n\n"
end
