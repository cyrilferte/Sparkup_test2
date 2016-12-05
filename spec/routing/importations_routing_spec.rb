require "rails_helper"

RSpec.describe ImportationsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/importations/new").to route_to("importations#new")
    end

    it "routes to #show" do
      expect(:get => "/importations/1").to route_to("importations#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/importations").to route_to("importations#create")
    end

  end
end
