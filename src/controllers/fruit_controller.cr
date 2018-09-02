require "../helpers/json_response"

class FruitController < ApplicationController
  include Controller::Helpers

  def all
    fruitEntities = FruitEntity.all

    fruits = fruitEntities.map do |fruitEntity|
      Fruit.new fruitEntity.id, fruitEntity.no, fruitEntity.description
    end

    response = Response::JSON.success fruits

    respond_with do
      json response.to_json
    end
  end

  def one
    fruitEntity = FruitEntity.find params[:id].to_i64

    response = if fruitEntity
      fruit = Fruit.new fruitEntity.id, fruitEntity.no, fruitEntity.description

      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end

  def new
    fruitEntity = FruitEntity.find_by no: params[:no]

    response = if fruitEntity
      Response::JSON.failure "Fruit already exists"
    else
      fruitEntity = FruitEntity.new

      fruitEntity.no = params[:no]
      fruitEntity.description = params[:description]

      fruitEntity.save

      fruit = Fruit.new fruitEntity.id, fruitEntity.no, fruitEntity.description

      Response::JSON.success fruit
    end

    respond_with do
      json response.to_json
    end
  end

  def edit
    fruitEntity = FruitEntity.find params[:id].to_i64

    response = if fruitEntity
      fruitEntity.no = params[:no]
      fruitEntity.description = params[:description]

      fruitEntity.save

      fruit = Fruit.new fruitEntity.id, fruitEntity.no, fruitEntity.description

      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end

  def delete
    fruitEntity = FruitEntity.find params[:id].to_i64

    response = if fruitEntity
      fruitEntity.destroy

      fruit = Fruit.new fruitEntity.id, fruitEntity.no, fruitEntity.description

      Response::JSON.success fruit
    else
      Response::JSON.failure "Fruit does not exists"
    end

    respond_with do
      json response.to_json
    end
  end
end
