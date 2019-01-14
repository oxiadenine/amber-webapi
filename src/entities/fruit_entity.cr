class FruitEntity < Granite::Base
  adapter sqlite

  table_name fruit

  primary id : Int32
  field no : String
  field description : String

  validate_not_nil :no
  validate_uniqueness :no
  validate_max_length :no, 20

  validate_not_nil :description
  validate_max_length :description, 50
end
