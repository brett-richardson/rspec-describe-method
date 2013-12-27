module RSpec
  module DescribeMethod
    module ClassExtensions

      def describe_method( method, *args, &block )
        throw ArgumentError.new 'Supplied method must be a String'      unless method.kind_of? String
        throw ArgumentError.new 'No block supplied to .describe_method' unless block.kind_of? Proc

        describe "when calling #{method}" do
          subject do
            old = super()

            case method[0]
            when '#' # Instance method ---
              if old.kind_of? Class then old.new else old       end
            when '.' # Class method ---
              if old.kind_of? Class then old     else old.class end
            else # Method type not recognized ---
              throw ArgumentError.new 'describe_method expects method name to begin with # or .'
            end.send method[1..-1], *args
          end

          instance_eval &block
        end
      end
      alias_method :when_calling, :describe_method

    end
  end
end