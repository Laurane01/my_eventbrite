require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do 
  	@user = User.create(first_name:'Mallau', last_name:"Jesaispastonnom", user_name:"Malaulau", description:"Jaime le code et le fromage surtout la raclette", email: "malaul@malau.com", encrypted_password: "145215245654")
  end 

  context "validation" do 
  	it "is valid with valid attributes" do
  		expect(@user).to be_a(User)
  		expect(@user).to be_valid
  	end 
end 

  	describe "first_name" do 
  		it "should not be valid without first_name" do
  			bad_user = User.create(first_name: "Doe")
  			expect(bad_user).not_to be_valid
  			expect(bad_user.errors.include?(:first_name)).to eq(true)
  		end 
  	end

  	describe "last_name" do 
  		it "should not be valid without last_name" do
  			bad_user = User.create(last_name: "Cou")
  			expect(bad_user).not_to be_valid
  			expect(bad_user.errors.include?(:last_name)).to eq(true)
  		end
  	end

  end

# vendredi semaine 4 install points importants- et faker a mettre au bon endroit et rspec pas au bon endroit====