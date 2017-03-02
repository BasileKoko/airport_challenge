
require 'plane'
describe Plane do

  it {is_expected.to respond_to(:landed)}
  it {is_expected.to respond_to(:taken_off)}

  it 'cannot land when plane has already landed' do
    allow(subject).to receive(:flying) {false}
    expect {subject.landed}.to raise_error 'Sorry the plane has already landed'
  end

  it 'cannot take off when the plane has already taken off' do
    allow(subject).to receive(:flying) {true}
    expect {subject.taken_off}.to raise_error 'Sorry the plane is flying'
  end
end
