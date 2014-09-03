require 'rails_helper'

RSpec.describe Music, :type => :model do

	it "should create a new instance given a valid attribute for music" do
      	expect(build(:music)).to be_valid
  	end


  	 it "is invalid without a title" do
        expect(build(:music, title: nil)).to have(1).errors_on(:title)
     end



end
