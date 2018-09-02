module Controller::Helpers
  module Response::JSON
    extend self

    def success(value)
      { ok: true, data: value }
    end

    def failure(value)
      { ok: false, error: value }
    end
  end
end
