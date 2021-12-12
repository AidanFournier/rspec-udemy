# change_matcher allows us to observe the state of an object both before and after a method is invoked
# allows us to track change over time
# modications to state over the course of an operation

RSpec.describe 'change matcher' do
    subject { [1, 2, 3, 4] }

    it 'checks that a method changes object state' do
        # expect { subject.push(4) }.to change { subject.length }.from(3).to(4)
        # this is a little too closely connected to the subject, because if the subject array changes, line 9 will now break
        expect { subject.push(4) }.to change { subject.length }.by(1)
    end

    it 'accepts negative arguments' do
        expect { subject.pop }.to change { subject.length }.from(4).to(3)
        expect { subject.pop }.to change { subject.length }.by(-1)
    end
end