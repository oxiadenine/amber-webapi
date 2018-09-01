require "./spec_helper"
require "../../src/models/fruit.cr"

describe Fruit do
  Spec.before_each do
    Fruit.clear
  end
end
