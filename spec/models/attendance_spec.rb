require 'rails_helper'

RSpec.describe Attendance, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context "associations" do 

  	describe "events" do
  		it { expect(@attendance).to belong_to(:event)}
  	end 
  end 
  context "associations" do 


  	describe "users" do
  		it { expect(@attendance).to belong_to(:user)}
  	end 
  end 
end
