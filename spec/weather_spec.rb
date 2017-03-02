describe Weather do
  it {is_expected.to respond_to(:stormy?)}
  it 'can return true ' do
    allow(subject).to receive(:stormy?) {true}
    expect(subject.stormy?).to eq true
  end
  it 'can return false ' do
    allow(subject).to receive(:stormy?) {false}
    expect(subject.stormy?).to eq false
  end
end
