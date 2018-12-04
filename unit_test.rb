require 'test/unit'
require './sample_hw'
require './interactive_test'

# general case for unit testing purposes
class HW1Test < Test::Unit::TestCase
    def test_simple_add
        assert_equal(1, add(1, 0))
        assert_equal(2, add(2, 0))
    end
end


# more specific case for interactive testing purposes
class InteractiveTest < Test::Unit::TestCase
    def test_simple_greet
        assert(Interactive.test_match(
            'greet.rb',
            'sample_text.txt',
            'greet_output.txt',
            'expected.txt',
            1,
            false
        ))
    end

    def test_simple_grandma
        assert(Interactive.test_match(
            'deaf_grandma.rb',
            'grandma_text.txt',
            'grandma_output.txt',
            'grandma_expected.txt',
            1,
            true
        ))
    end
end