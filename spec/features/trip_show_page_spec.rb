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

    expect(page).to have_content(trip.name)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.end_date)
  end

#   As a visitor,
# when I visit a hiking trip's page,
# I see a list of trails included in the trip,
# I see the name, address, and length for each trail.

  it 'displays trail attributes' do
    trip = Trip.create(name: 'something', start_date: 1.day.ago, end_date: Time.now.utc)

    trail_1 = Trail.create(name: 'name', length: 3, address: 'PO BOX 3')
    trail_2 = Trail.create(name: 'another name', length: 2, address: 'PO BOX 1')
    trail_3 = Trail.create(name: 'new name', length: 4, address: 'PO BOX 4')
    TripTrail.create(trip: trip, trail: trail_1)
    TripTrail.create(trip: trip, trail: trail_2)
    TripTrail.create(trip: trip, trail: trail_3)

    visit trips_path

    click_on "#{trip.name}"

    expect(current_path).to eq(trip_path(trip))

    expect(page).to have_content(trip.name)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.end_date)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content(trail_3.name)

    expect(page).to have_content(trail_1.length)
    expect(page).to have_content(trail_2.length)
    expect(page).to have_content(trail_3.length)

    expect(page).to have_content(trail_1.address)
    expect(page).to have_content(trail_2.address)
    expect(page).to have_content(trail_3.address)

    expect(trip.trails_length).to eq(9)
    expect(trip.trails_average).to eq(3)
    expect(trip.longest_distance).to eq(4)
    expect(trip.shortest_distance).to eq(2)
  end
end
