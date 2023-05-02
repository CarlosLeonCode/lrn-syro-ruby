require "syro"

App = Syro.new do
  on "hello" do
    on :name do
      get do
        res.text "Hello #{inbox[:name]}"
      end
    end
  end
end

env = {
  "REQUEST_METHOD" => "GET",
  "PATH_INFO"      => "/hello/world",
}

p App.call(env)


env = {
  "REQUEST_METHOD" => "GET",
  "PATH_INFO"      => "/hello/there",
}

p App.call(env)
