describe Board do
  describe '.valid_position?' do
    let(:x) { 0 }
    let(:y) { 0 }
    subject { Board.new.valid_position?(x, y) }

    context 'when y is greater than 4' do
      let(:y) { rand(5..100) }

      it { is_expected.to eq false }
    end

    context 'when y is between 0 and 4' do
      let(:y) { rand(0..4) }

      it { is_expected.to eq true }
    end

    context 'when y is less than 0' do
      let(:y) { rand(-100..-1) }

      it { is_expected.to eq false }
    end

    context 'when x is greater than 4' do
      let(:x) { rand(5..100) }

      it { is_expected.to eq false }
    end

    context 'when x is between 0 and 4' do
      let(:x) { rand(0..4) }

      it { is_expected.to eq true }
    end

    context 'when x is less than 0' do
      let(:x) { rand(-100..-1) }

      it { is_expected.to eq false }
    end
  end
end