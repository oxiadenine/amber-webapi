Amber::Server.configure do
  pipeline :api do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::CORS.new
  end

  routes :web, "/api" do
    get "/", ApiController, :index
  end

  routes :api do
  end
end
