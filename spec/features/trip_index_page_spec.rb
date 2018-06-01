# As a visitor,
# when I visit the hiking trips index page,
# I see a list of all hiking trip names in
# the database.

require 'rails_helper'

describe 'Trip index page' do
  it 'Displays trip names' do
    trip_1 = Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)
    trip_2= Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)
    trip_3 = Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)

    visit trips_path

    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trip_3.name)
  end
end
