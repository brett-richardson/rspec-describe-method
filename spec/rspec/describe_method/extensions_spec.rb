require 'spec_helper'


describe RSpec::DescribeMethod::ClassExtensions do

	describe '.describe_method' do
		it 'adds the .describe_method to the describe context' do
      expect( self.class.methods ).to include :describe_method
    end
	end

  context 'describing a String instance' do
    subject{ 'TEST' }

    describe 'instance methods' do
      describe_method '#downcase' do
        it{ should eq 'test' }

        describe 'nested' do
          describe_method '#upcase' do
            it{ should eq 'TEST' }
          end
        end
      end

      context 'with arguments' do
        describe_method '#sub', 'ST', 'STING' do
          it{ should eq 'TESTING' }
        end
      end
    end

    describe 'class methods are called on the instance\'s class' do
      describe_method '.new' do
        it{ should be_a String }
      end
    end

    describe '.when_calling alias' do
      when_calling '.new' do
        it{ should be_a String }
      end
    end
  end


  context 'describing the String class' do
    subject{ String }

    describe 'class methods' do
      describe_method '.new' do
        it{ should be_a String }
      end
    end

    describe 'instance methods' do
      describe 'creates instance without arguments' do
        describe_method '#+', 'nothing' do
          it{ should eq 'nothing' }
        end
      end
    end
  end

end
