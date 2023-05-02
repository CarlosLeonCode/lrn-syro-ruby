require 'syro'

env = {
  "REQUEST_METHOD" => "GET",
  "PATH_INFO"      => "/",
}

app = Syro.new do
  get do
    res.text 'Hello, world'
  end
end

p app.call(env)

env = {
  "REQUEST_METHOD" => "GET",
  "PATH_INFO"      => "/foo/bar/baz",
}

app = Syro.new do
  on "foo" do
    on "bar" do
      on "baz" do
        get do
          res.text "Hello world, from segments"
        end
      end
    end
  end
end

p app.call(env)
