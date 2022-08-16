describe RobotSimulator do
  describe '.extract_instruction' do
    let(:instruction) { 'PLACE 0,0,NORTH' }
    let(:robot_simulator) { RobotSimulator.new }
    subject { robot_simulator.extract_instruction(instruction) }

    context 'PLACE command' do
      it { expect { subject }.to change { robot_simulator.command }.to('PLACE') }
      it { expect { subject }.to change { robot_simulator.x }.to(0) }
      it { expect { subject }.to change { robot_simulator.y }.to(0) }
      it { expect { subject }.to change { robot_simulator.face_to }.to('NORTH') }
    end

    context 'MOVE command' do
      let(:instruction) { 'MOVE' }

      it { expect { subject }.to change { robot_simulator.command }.to('MOVE') }
    end

    context 'LEFT command' do
      let(:instruction) { 'LEFT' }

      it { expect { subject }.to change { robot_simulator.command }.to('LEFT') }
    end

    context 'RIGHT command' do
      let(:instruction) { 'RIGHT' }

      it { expect { subject }.to change { robot_simulator.command }.to('RIGHT') }
    end
  end
end