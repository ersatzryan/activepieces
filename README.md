# Activepieces

Ruby interface for the Activepieces API

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add activepieces

Or in your Gemfile add

    gem "activepieces"

## Usage

In `config/initializers/activepieces.rb` add your API KEY and `base_url` (default: `https://cloud.activepieces.com`)

```ruby
Activepieces.configure do |config|
  config[:api_key] = ENV["ACTIVEPIECES_API_KEY"]
  config[:host] = "my.server.com"
end
```

### Projects

#### List all Projects

```ruby
client = Activepieces::Client.new
projects = client.projects

# OR

Activepieces::Project.list
```

#### Create a new project

```ruby
Activepieces::Project.create(display_name: "My new project", external_id: "asdf") #=> <Activepieces::Project @display_name: "My New Project">
```

#### Get a project
```ruby
client = Activepieces::Client.new
projects = client.projects.find(1)

# or

project = Activepieces::Project.find(1)
```

#### Update a project

```ruby
project = Activepieces::Project.find(1)
project.update(display_name: "My old project")
```

### Flows

#### List project flows
```ruby
project = Activepieces::Project.find(1)
project.flows #=> [<Activepieces::Flow>, <Activepieces::Flow>]

# or

Activepieces::Flow.list(project_id: 1) #=> [<Activepieces::Flow>, <Activepieces::Flow>]

# or
client.flows.list(project_id: 1)
```

#### Get
```ruby
Activepieces::Flow.find("ak42jn") #=> <Activepieces::Flow>

# or
client.flows.find("ak42jn")
```

#### Create a flow
```ruby
Activepieces::Flow.create(project_id: 1, display_name: "My First Flow")

#or 
project.create_flow(display_name: "My First Flow")
```

#### Delete a flow
```ruby
Activepieces::Flow.delete("ak42jn")

#or 
flow = Activepieces::Flow.find("ak42jn")
flow.delete
```

#### Applying a Flow Operation (Updating a flow)
Coming soon

### Flow Runs

#### List Flow runs
```ruby
Activepieces::FlowRun.list(flow_id: "ak42jn")

#or 
flow = Activepieces::Flow.find("ak42jn")
flow.runs #=> [<Activepieces::FlowRun>, <Activepieces::FlowRun>]
```

#### Get a Flow run
```ruby
Activepieces::FlowRun.find("nm12ik") #=> <Activepieces::FlowRun>

# or 
flow.runs.find("nm12ik")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activepieces.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
