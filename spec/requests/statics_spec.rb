require 'spec_helper'

describe "Statics" do
  describe "testing rspec" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      page.should have_content('Welcome to my sandbox!')
      page.should have_content('Welcome')
    end
    
    it "should respond to the new posts path" do 
      get new_post_path
      response.status.should be(200)
    end
  end
end

