require 'spec_helper'

describe User do
	before (:each) do
		@attr = {:name => "Example user", :email => "user@example.com"}
	end
	
  it "should create a new instance given a valid attribute" do
	User.create!(@attr)
	end
	
	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end
	
	it "should require a name" do
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end
	
	it "should reject duplicate email addresses" do
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should be_valid
	end
end
