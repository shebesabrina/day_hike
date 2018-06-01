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

#   As a visitor,
# when I visit a hiking trip's page,
# I see a list of trails included in the trip,
# I see the name, address, and length for each trail.

  it 'displays trail attributes' do
    trip = Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)
    trail = Trail.create(name: 'name', length: 3, address: 'PO BOX 3')

    TripTrail.create(trip: trip, trail: trail)

    visit trip_path(trip)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.length)
    expect(page).to have_content(trail.address)
  end
end
