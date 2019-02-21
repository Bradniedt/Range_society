require 'rails_helper'

RSpec.describe UserDecorator do
  describe 'last_ten_destinations' do
    it 'should return last_ten_destinations' do
      user = User.create(first_name: 'john', last_name: 'smith', email: 'js@gmail.com', token: 'aaa', refresh_token: 'aaa')
      user.destinations.create(name: "1place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "2place", location: "2location")
      user.destinations.create(name: "3place", location: "3location")
      user.destinations.create(name: "4place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "5place", location: "2location")
      user.destinations.create(name: "6place", location: "3location")
      user.destinations.create(name: "7place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "8place", location: "2location")
      user.destinations.create(name: "9place", location: "3location")
      user.destinations.create(name: "10place", location: "3location")
      user.destinations.create(name: "11place", location: "3location")
      decorator = user.decorate
      expect(decorator.last_ten_destinations.count).to eq(10)
    end
  end
    it 'should list_last_ten' do
      user = User.create(first_name: 'john', last_name: 'smith', email: 'js@gmail.com', token: 'aaa', refresh_token: 'aaa')
      user.destinations.create(name: "1place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "2place", location: "2location")
      user.destinations.create(name: "3place", location: "3location")
      user.destinations.create(name: "4place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "5place", location: "2location")
      user.destinations.create(name: "6place", location: "3location")
      user.destinations.create(name: "7place", location: "1location", created_at: 1.days.ago)
      user.destinations.create(name: "8place", location: "2location")
      user.destinations.create(name: "9place", location: "3location")
      user.destinations.create(name: "10place", location: "3location")
      user.destinations.create(name: "11place", location: "3location")
      decorator = user.decorate
      expect(decorator.list_last_ten.split('div>').length).to eq(10)
  end
  it 'should return you have no destinations if destinations is empty' do
    user = User.create(first_name: 'john', last_name: 'smith', email: 'js@gmail.com', token: 'aaa', refresh_token: 'aaa')
    decorator = user.decorate
    expect(decorator.list_last_ten).to eq("<h4>You have no trips</h4>")
  end


end
