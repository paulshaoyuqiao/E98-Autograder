require 'test/unit'
require './Interactive'

class Week1Test < Test::Unit::TestCase
    @@add =  './HW1/add.rb'
    @@sub =  './HW1/subtract.rb'

    def test_add
        assert(Interactive.test_match(
            @@add,
            '',
            './week1/addOutput.txt',
            './week1/addExpected.txt',
            1,
            false,
            false
        ))
    end

    def test_subtract
        assert(Interactive.test_match(
            @@sub,
            '',
            './week1/subOutput.txt',
            './week1/subExpected.txt',
            1,
            false,
            false
        ))
    end
end

