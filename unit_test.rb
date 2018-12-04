require 'test/unit'
require './static_methods_demo/add'
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
            './interactive_methods_demo/greet.rb',
            './interactive_methods_demo/sample_text.txt',
            './interactive_methods_demo/greet_output.txt',
            './interactive_methods_demo/expected.txt',
            1,
            false
        ))
    end

    def test_simple_grandma
        assert(Interactive.test_match(
            './interactive_methods_demo/deaf_grandma.rb',
            './interactive_methods_demo/grandma_text.txt',
            './interactive_methods_demo/grandma_output.txt',
            './interactive_methods_demo/grandma_expected.txt',
            1,
            true
        ))
    end
end