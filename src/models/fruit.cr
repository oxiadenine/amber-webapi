struct Fruit
  def initialize(@id : Int64?, @no : String?, @description : String?)
  end

  JSON.mapping(id: Int64?, no: String?, description: String?)
end
