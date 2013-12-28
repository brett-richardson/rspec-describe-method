[![Build Status](https://travis-ci.org/brett-richardson/rspec-describe-method.png?branch=master)](https://travis-ci.org/brett-richardson/rspec-describe-method)

Using Rspec DescribeMethod
==========================

Using Rspec DescribeMethod is super simple.


In your Gemfile:
```ruby
group :development, :testing do
  gem 'rspec-describe-method'
end
```


In your spec_helper.rb:
```ruby
require 'rspec/describe-method'
```

And your specs can look like this:

```ruby
describe String do
    describe_method '.new' do
        it{ should be_a String }
    end

    describe_method '#concat', 'argument' do
        it{ should match /argument/i }
    end

    context 'with an instance' do
        subject{ String.new 'test' }

        describe_method '#upcase' do
            it{ should eq 'TEST' }
        end
    end
end
```

So what's happening behind the scenes?
--------------------------------------

Essentially we do a little bit of meta-programming and replace the describe_method with a normal describe and subject call as so:


```ruby
describe User do
    #--- This... ---------------

    describe_method '#to_s' do
        it{ should be_a String }
    end

    #--- Is Equivalent to... ---

    describe '#to_s' do
        subject{ described_class.new.to_s }

        it{ should be_a String }
    end
end
```


```ruby
describe User do
    subject( :instance ){ described_class.new }

    #--- This... ----------------

    describe_method '.find', 1 do
        it{ should be_a User }
    end

    #--- Is Equivalent to... ----

    describe '.find( 1 )' do
        subject{ instance.class.find 1 }

        it{ should be_a String )
    end
end
```


Describe a method call on the current test `subject` in your specs with 'describe_method', and a `#` for instance methods and a `.` for class methods.

Instances will automatically delagate to their class, and classes will automatically create an instance of themselves.


Alias method: when_calling
--------------------------

The alias method `when_calling` is provided which makes specs more human-readable, especially when calls are nested within eachother:


```ruby
describe String do
    subject{ String.new 'test' }

    when_calling '#upcase' {
        it{ should eq 'TEST' }

        when_calling '#+', 'ING' {
            it{ should eq 'TESTING' }
        }
    }
end
```


NOTE
----
When the subject is a Class, and you call an instance method `describe_method "#something"`
the class will call `.new` on itself with __NO ARGUMENTS__, you may not want this behavior.
