require "spec_helper"

describe EmploymentDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/employment_details").should route_to("employment_details#index")
    end

    it "routes to #new" do
      get("/employment_details/new").should route_to("employment_details#new")
    end

    it "routes to #show" do
      get("/employment_details/1").should route_to("employment_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employment_details/1/edit").should route_to("employment_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employment_details").should route_to("employment_details#create")
    end

    it "routes to #update" do
      put("/employment_details/1").should route_to("employment_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employment_details/1").should route_to("employment_details#destroy", :id => "1")
    end

  end
end
