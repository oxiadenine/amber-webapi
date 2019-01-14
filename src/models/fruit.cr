struct Fruit
  def initialize(@id : Int32?, @no : String?, @description : String?)
  end

  JSON.mapping(id: Int32?, no: String?, description: String?)
end
