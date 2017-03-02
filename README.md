[![Build
Status](https://travis-ci.org/travis-ci/travis-web.svg?branch=master)](https://travis-ci.org/travis-ci/travis-web)

# The Airport challenge:
Task
-----
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Project folders:
The code I have written are within the folder lib and the tests are in spec folder.

Project gems:

```
 gem 'rspec'
 gem 'capybara'
 gem 'coveralls'
 gem 'rubocop'
 gem 'reek'
 gem 'rake'
```

User stories:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Running code in PRY:
```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007fb108a5faa8 @capacity=12, @planes=[], @weather=#<Weather:0x007fb108a5f9b8>>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007fb1089d53d0 @flying=true>
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007fb1089d53d0 @flying=false>]
[5] pry(main)> airport.take_off(plane)
=> #<Plane:0x007fb1089d53d0 @flying=true>
[6] pry(main)> airport.take_off(plane)
RuntimeError: Sorry the plane is flying
from /Users/Basile/Desktop/makers_2017/projects/airport_challenge/lib/plane.rb:16:in `taken_off'
[7] pry(main)> airport.land(plane)
=> [#<Plane:0x007fb1089d53d0 @flying=false>]
[8] pry(main)> airport.land(plane)
RuntimeError: Sorry the plane has already landed
[9] pry(main)> plane1 = Plane.new
=> #<Plane:0x007fb1092c1430 @flying=true>
[10] pry(main)> airport.land(plane1)
RuntimeError: You cannot land due to bad weather
```
