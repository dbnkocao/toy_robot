describe Robot do
  let(:face_to) { 'NORTH'}
  let(:robot) { Robot.new(0, 0, face_to) }

  describe '.left' do
    context 'when face_to is NORTH' do
      it 'changes face_to to WEAST' do
        expect { robot.left }.to change { robot.face_to }.to('WEAST')
      end
    end

    context 'when face_to is WEAST' do
      let(:face_to) { 'WEAST' }

      it 'changes face_to to SOUTH' do
        expect { robot.left }.to change { robot.face_to }.to('SOUTH')
      end
    end

    context 'when face_to is SOUTH' do
      let(:face_to) { 'SOUTH' }

      it 'changes face_to to EAST' do
        expect { robot.left }.to change { robot.face_to }.to('EAST')
      end
    end

    context 'when face_to is EAST' do
      let(:face_to) { 'EAST' }

      it 'changes face_to to NORTH' do
        expect { robot.left }.to change { robot.face_to }.to('NORTH')
      end
    end
  end

  describe '.right' do
    context 'when face_to is NORTH' do
      it 'changes face_to to EAST' do
        expect { robot.right }.to change { robot.face_to }.to('EAST')
      end
    end

    context 'when face_to is WEAST' do
      let(:face_to) { 'WEAST' }

      it 'changes face_to to NORTH' do
        expect { robot.right }.to change { robot.face_to }.to('NORTH')
      end
    end

    context 'when face_to is SOUTH' do
      let(:face_to) { 'SOUTH' }

      it 'changes face_to to WEAST' do
        expect { robot.right }.to change { robot.face_to }.to('WEAST')
      end
    end

    context 'when face_to is EAST' do
      let(:face_to) { 'EAST' }

      it 'changes face_to to SOUTH' do
        expect { robot.right }.to change { robot.face_to }.to('SOUTH')
      end
    end
  end

  describe '.move' do
    context 'when face_to is NORTH' do
      it 'decreases y by 1' do
        expect { robot.move }.to change { robot.cordinate_y }.to(robot.cordinate_y - 1)
      end

      it 'keeps x value' do
        expect { robot.move }.to_not change { robot.cordinate_x }
      end
    end

    context 'when face_to is EAST' do
      let(:face_to) { 'EAST' }

      it 'increases x by 1' do
        expect { robot.move }.to change { robot.cordinate_x }.by(1)
      end

      it 'keeps y value' do
        expect { robot.move }.to_not change { robot.cordinate_y }
      end
    end

    context 'when face_to is SOUTH' do
      let(:face_to) { 'SOUTH' }

      it 'increases y by 1' do
        expect { robot.move }.to change { robot.cordinate_y }.to(robot.cordinate_y + 1)
      end

      it 'keeps x value' do
        expect { robot.move }.to_not change { robot.cordinate_x }
      end
    end

    context 'when face_to is WEAST' do
      let(:face_to) { 'WEAST' }

      it 'decreases x by 1' do
        expect { robot.move }.to change { robot.cordinate_x }.by(-1)
      end

      it 'keeps y value' do
        expect { robot.move }.to_not change { robot.cordinate_y }
      end
    end
  end
end