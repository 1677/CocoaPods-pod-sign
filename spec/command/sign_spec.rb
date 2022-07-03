require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Sign do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ sign }).should.be.instance_of Command::Sign
      end
    end
  end
end

