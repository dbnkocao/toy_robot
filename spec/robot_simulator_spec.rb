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

  describe '.execute_command' do
    let(:robot) { instance_double("Robot", cordinate_x: 0, cordinate_y: 0, face_to: 'EAST', valid?: true) }

    before do
      allow(robot_simulator).to receive(:robot).and_return(robot)
      allow(robot_simulator).to receive(:command).and_return(instruction)
    end

    context 'PLACE command' do
      let(:instruction) { 'PLACE' }

      before do
        allow(robot_simulator).to receive(:command).and_return('PLACE')
        allow(robot_simulator).to receive(:x).and_return(0)
        allow(robot_simulator).to receive(:y).and_return(0)
        allow(robot_simulator).to receive(:face_to).and_return('NORTH')
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