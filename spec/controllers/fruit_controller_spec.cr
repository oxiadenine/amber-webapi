require "./spec_helper"

def fruit_hash
  {"no" => "Fake", "description" => "Fake"}
end

def fruit_params
  params = [] of String
  params << "no=#{fruit_hash["no"]}"
  params << "description=#{fruit_hash["description"]}"
  params.join("&")
end

def create_fruit
  model = Fruit.new(fruit_hash)
  model.save
  model
end

class FruitControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe FruitControllerTest do
  subject = FruitControllerTest.new

  it "renders fruit index template" do
    Fruit.clear
    response = subject.get "/fruits"

    response.status_code.should eq(200)
    response.body.should contain("fruits")
  end

  it "renders fruit show template" do
    Fruit.clear
    model = create_fruit
    location = "/fruits/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Fruit")
  end

  it "renders fruit new template" do
    Fruit.clear
    location = "/fruits/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Fruit")
  end

  it "renders fruit edit template" do
    Fruit.clear
    model = create_fruit
    location = "/fruits/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Fruit")
  end

  it "creates a fruit" do
    Fruit.clear
    response = subject.post "/fruits", body: fruit_params

    response.headers["Location"].should eq "/fruits"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a fruit" do
    Fruit.clear
    model = create_fruit
    response = subject.patch "/fruits/#{model.id}", body: fruit_params

    response.headers["Location"].should eq "/fruits"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a fruit" do
    Fruit.clear
    model = create_fruit
    response = subject.delete "/fruits/#{model.id}"

    response.headers["Location"].should eq "/fruits"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
