Amber::Server.configure do
  pipeline :api do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
  end

  routes :api, "/api" do
    get "/", ApiController, :index
    get "/fruits", FruitController, :all
    get "/fruits/:id", FruitController, :one
    post "/fruits", FruitController, :new
    put "/fruits/:id", FruitController, :edit
    delete "/fruits/:id", FruitController, :delete
  end
end
