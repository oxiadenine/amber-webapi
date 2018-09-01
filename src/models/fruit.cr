class Fruit < Granite::Base
  adapter pg

  table_name fruit

  primary id : Int64
  field no : String
  field description : String

  timestamps
end
