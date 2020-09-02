require 'date'
require 'rspec/autorun'
require_relative 'calendar'
describe Calendar do
  calendar_test = Calendar.new
  it 'Adds Event to calendar' do
    expect(calendar_test.add_event('2020-09-12', 'Arifa', 'Hello')).to eq('Event has been added')
  end
  it 'Update Event in calendar' do
    expect(calendar_test.update_event('2020-09-12')).to eq('Event has been updated')
  end
  it 'Adds Multiple events on same date' do
    expect(calendar_test.send(:add_multiple_events, '2020-09-12', 'Ruby', 'Language')).to eq('Event has been added')
  end
  it 'Update multiple events' do
    expect(calendar_test.send(:update_multiple_events, '2020-09-12')).to eq('Event has been updated')
  end
  it 'Removes multiple events from calendar' do
    expect(calendar_test.send(:remove_multiple_events, '2020-09-12')).to eq('Event has been removed')
  end
  it 'Removes Event from Calendar' do
    expect(calendar_test.remove_event('2020-09-12')).to eq('Event has been removed')
  end
end
