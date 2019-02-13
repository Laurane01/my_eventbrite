require 'rails_helper'

RSpec.describe Event, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe "title" do 
  	it "should not be valid without title" do 
  		invalid_title = Event.create(start_date:1.day.from_now, description:"Je suis le meilleur evenement pour les codeurs THP", location: "Moncul", duration: 4, title: "Yo", price: 20)
  		expect(invalid_title).not_to be_valid
  		expect(invalid_title.errors.include?(:title)).to eq(true)
  	end 
  end 

  describe "duration" do
  	it "should return an integer" do 
  		expect(@event.duration).to be_a(Integer)
  	end 
  end 

end 
