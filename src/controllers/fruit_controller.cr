class FruitController < ApplicationController
  def all
    fruits = Fruit.all

    response = { ok: true, data: fruits }

    respond_with do
      json response.to_json
    end
  end

  def one
    fruit = Fruit.find params[:id].to_i64

    response = if fruit
      { ok: true, data: fruit }
    else
      { ok: false, error: "Fruit does not exists" }
    end

    respond_with do
      json response.to_json
    end
  end

  def new
    fruit = Fruit.find_by no: params[:no]

    response = if fruit
      { ok: false, error: "Fruit already exists" }
    else
      fruit = Fruit.new

      fruit.no = params[:no]
      fruit.description = params[:description]

      fruit.save

      { ok: true, data: fruit }
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

      { ok: true, data: fruit }
    else
      { ok: false, error: "Fruit does not exists" }
    end

    respond_with do
      json response.to_json
    end
  end

  def delete
    fruit = Fruit.find params[:id].to_i64

    response = if fruit
      fruit.destroy

      { ok: true, data: fruit }
    else
      { ok: false, error: "Fruit does not exists" }
    end

    respond_with do
      json response.to_json
    end
  end
end
