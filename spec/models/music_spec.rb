require 'rails_helper'

RSpec.describe Music, :type => :model do

	it "should create a new instance given a valid attribute for music" do
      	expect(build(:music)).to be_valid
  	 end

end
