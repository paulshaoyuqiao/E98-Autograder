require 'test/unit'
require './Interactive'
require './week3/ch09/new_roman_numerals.rb'
require './week3/ch09/old_roman_numerals.rb'

class Week3Test < Test::Unit::TestCase
    @@ask_inp_1 = './week3_test/ask_1_in.txt'
    @@ask_oup_1 = './week3_test/ask_1_out.txt'
    @@ask_inp_2 = './week3_test/ask_2_in.txt'
    @@ask_oup_2 = './week3_test/ask_2_out.txt'

    def test_ask1
        assert(Interactive.test_partial_str_match(
            './ask_mode.rb',
            @@ask_inp_1,
            @@ask_oup_1,
            'false',
            1
        ))
    end

    def test_ask2
        assert(Interactive.test_partial_str_match(
            './ask_mode.rb',
            @@ask_inp_2,
            @@ask_oup_2,
            'true',
            1
        ))
    end

    def test_old_roman0
        assert_nil(romanize_old(0))
    end

    def test_old_roman1
        assert_equal('VII', romanize_old(7))
    end

    def test_old_roman2
        assert_equal('LXVIIII', romanize_old(69))
    end

    def test_old_roman3
        assert_equal('CCCCLXXIII', romanize_old(473))
    end

    def test_old_roman4
        assert_equal('MMXVIIII', romanize_old(2019))
    end

    def test_new_roman0
        assert_nil(romanize_new(0))
    end

    def test_new_roman10
        assert_nil(romanize_new(-50))
    end

    def test_new_roman1
        assert_equal('VII', romanize_new(7))
    end

    def test_new_roman2
        assert_equal('LXIX', romanize_new(69))
    end

    def test_new_roman3
        assert_equal('CDLXXIII', romanize_new(473))
    end

    def test_new_roman4
        assert_equal('MMXIX', romanize_new(2019))
    end

    def test_new_roman5
        assert_nil(romanize_new(1000000))
    end
end
