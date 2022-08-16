describe RobotSimulator do
  let(:robot_simulator) { RobotSimulator.new }

  describe '.extract_instruction' do
    let(:instruction) { 'PLACE 0,0,NORTH' }
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

    context 'REPORT command' do
      let(:instruction) { 'REPORT' }

      it { expect { subject }.to change { robot_simulator.command }.to('REPORT') }
    end
  end

  describe '.execute_movement' do
    let(:robot) { Robot.new(0,0,'EAST') }

    before do
      robot_simulator.stub(:robot) { robot }
      robot_simulator.stub(:command) { instruction }
    end

    context 'PLACE command' do
      before do
        robot_simulator.stub(:command) { 'PLACE' }
        robot_simulator.stub(:x) { 0 }
        robot_simulator.stub(:y) { 0 }
        robot_simulator.stub(:face_to) { 'NORTH' }
      end


      it 'calls robot new with right arguments' do
        expect(Robot).to receive(:new).with(0, 0, 'NORTH')

        robot_simulator.execute_command
      end
    end

    context 'LEFT command' do
      let(:instruction) { 'LEFT' }

      it 'calls robot left command' do
        expect(robot_simulator.robot).to receive(:left)

        robot_simulator.execute_command
      end
    end

    context 'RIGHT command' do
      let(:instruction) { 'RIGHT' }

      it 'calls robot right command' do
        expect(robot_simulator.robot).to receive(:right)

        robot_simulator.execute_command
      end
    end

    context 'MOVE command' do
      let(:instruction) { 'MOVE' }

      it 'calls robot move command' do
        expect(robot_simulator.robot).to receive(:move)

        robot_simulator.execute_command
      end
    end

    context 'REPORT command' do
      let(:instruction) { 'REPORT' }

      it 'calls robot report command' do
        expect(robot_simulator.robot).to receive(:report)

        robot_simulator.execute_command
      end
    end
  end
end