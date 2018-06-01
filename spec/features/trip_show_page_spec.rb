# As a visitor,
# when I visit the hiking trips index page,
# and I click on the name of a hiking trip,
# I see a unique page for that hiking trip.

require 'rails_helper'

describe 'Trip Show page' do
  it 'displays a unique page' do
    trip = Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)

    visit trip_path(trip)

    expect(current_path).to eq(trip_path(trip))
  end
end
