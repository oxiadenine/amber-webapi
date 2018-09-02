require "../helpers/json_response"

class FruitController < ApplicationController
  include Controller::Helpers

  def all
    fruits = Fruit.all

    response = Response::JSON.success fruits

    respond_with do
      json response.to_json
    end
  end

  def one
    fruit = Fruit.find params[:id].to_i64

    response = if fruit
      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end

  def new
    fruit = Fruit.find_by no: params[:no]

    response = if fruit
      Response::JSON.failure "Fruit already exists"
    else
      fruit = Fruit.new

      fruit.no = params[:no]
      fruit.description = params[:description]

      fruit.save

      Response::JSON.success fruit
    end

    respond_with do
      json response.to_json
    end
  end

  def edit
    fruit = Fruit.find params[:id].to_i64

    response = if fruit
      fruit.no = params[:no]
      fruit.description = params[:description]

      fruit.save

      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end

  def delete
    fruit = Fruit.find params[:id].to_i64

    response = if fruit
      fruit.destroy

      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end
end
