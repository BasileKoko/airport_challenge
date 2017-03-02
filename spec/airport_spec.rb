
require 'airport'
require 'plane'

describe Airport do
  let(:plane) {double :plane}
  let(:weather) {double :weather}


  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:full?)}

  it 'should return an error when the airport is full' do
    allow(plane).to  receive(:landed)
    allow(subject.weather).to receive(:stormy?) {false}
    subject.capacity.times{subject.land plane}
    expect {subject.land plane}.to raise_error "Sorry you cannot land, airport is full"
  end


  it 'return error when the weather is bad to land' do
    allow(plane).to  receive(:landed)
    allow(subject.weather).to receive(:stormy?) {true}
    message = 'You cannot land due to bad weather'
    expect { subject.land(plane) }.to raise_error message
  end

  it 'return error when the weather is bad to take_off' do
    allow(plane).to receive(:taken_off)
    allow(subject.weather).to receive(:stormy?) {true}
    message = 'You cannot take_off due to bad weather'
    expect { subject.take_off(plane) }.to raise_error "You cannot take off due to bad weather"
 end


  it 'allow plane to land after storm has cleared' do
    allow(plane).to  receive(:landed)
    allow(subject.weather).to receive(:stormy?) {false}
    expect { subject.land(plane) }.not_to raise_error
  end

end
