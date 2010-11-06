require 'spec_helper'

describe Style do

  before(:each) do
    @attr = { :name => "Sample Style" }
  end

  describe "beer association" do
    
    before(:each) do
      @style = Style.create(@attr)
    end

    it "should have a beers attribute" do
      @style.should respond_to(:beers)
    end
  end
end
