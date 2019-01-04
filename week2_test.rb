require 'test/unit'
require './Interactive'

class Week2Test < Test::Unit::TestCase
    @@nn_bottles = './week2/ch07/99_bob.rb'
    @@deaf_grandma = './week2/ch07/deaf_grandma.rb'
    @@deaf_grandma_extended = './week2/ch07/deaf_grandma_extended.rb'
    @@leap_year_counter = './week2/ch07/leap_year_counter.rb'
    @@array_sort = './week2/ch08/array_sort.rb'
    @@table_of_contents = './week2/ch08/table_of_contents.rb'

    def test_99_bottles
        assert(Interactive.test_match(
            @@nn_bottles,
            '',
            './week2_test/99_bottles_oup.txt',
            './week2_test/99_bottles_expected.txt',
            1,
            true,
            false,
            Array(1..350)
        ))
    end

    def test_deaf_grandma
        assert(Interactive.test_match(
            @@deaf_grandma,
            './week2_test/deaf_grandma_inp_quit.txt',
            './week2_test/deaf_grandma_oup_quit.txt',
            './week2_test/deaf_grandma_expected_quit.txt',
            1,
            true,
            true,
            Array(2..10)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma,
            './week2_test/deaf_grandma_inp_years.txt',
            './week2_test/deaf_grandma_oup_years.txt',
            './week2_test/deaf_grandma_expected_years.txt',
            1,
            true,
            true,
            Array(2..10)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma,
            './week2_test/deaf_grandma_inp_1.txt',
            './week2_test/deaf_grandma_oup_1.txt',
            './week2_test/deaf_grandma_expected_1.txt',
            5,
            true,
            true,
            Array(2..20)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma,
            './week2_test/deaf_grandma_inp_2.txt',
            './week2_test/deaf_grandma_oup_2.txt',
            './week2_test/deaf_grandma_expected_2.txt',
            5,
            true,
            true,
            Array(2..20)
        ))
    end

    def test_deaf_grandma_extended
        assert(Interactive.test_match(
            @@deaf_grandma_extended,
            './week2_test/deaf_grandma_extended_inp_quit.txt',
            './week2_test/deaf_grandma_extended_oup_quit.txt',
            './week2_test/deaf_grandma_extended_expected_quit.txt',
            1,
            true,
            true,
            Array(2..10)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma_extended,
            './week2_test/byes_inp.txt',
            './week2_test/byes_oup.txt',
            './week2_test/byes_expected.txt',
            5,
            true,
            true,
            Array(2..20)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma_extended,
            './week2_test/integrated_inp_1.txt',
            './week2_test/integrated_oup_1.txt',
            './week2_test/integrated_expected_1.txt',
            5,
            true,
            true,
            Array(2..30)
        ))

        assert(Interactive.test_match(
            @@deaf_grandma_extended,
            './week2_test/integrated_inp_2.txt',
            './week2_test/integrated_oup_2.txt',
            './week2_test/integrated_expected_2.txt',
            5,
            true,
            true,
            Array(2..30)
        ))
    end

    def test_leap_year_counter
        assert(Interactive.test_num_match_only(
            @@leap_year_counter,
            './week2_test/leap_oup_none.txt',
            './week2_test/leap_expected_none.txt',
            1,
            false,
            true,
            './week2_test/leap_inp_none.txt'
        ))

        assert(Interactive.test_num_match_only(
            @@leap_year_counter,
            './week2_test/leap_oup_one.txt',
            './week2_test/leap_expected_one.txt',
            1,
            false,
            true,
            './week2_test/leap_inp_one.txt'
        ))

        assert(Interactive.test_num_match_only(
            @@leap_year_counter,
            './week2_test/leap_oup_many.txt',
            './week2_test/leap_expected_many.txt',
            3,
            false,
            true,
            './week2_test/leap_inp_many.txt'
        ))
    end

    def test_array_sort
        assert(Interactive.test_match(
            @@array_sort,
            './week2_test/standard_arr_inp.txt',
            './week2_test/standard_arr_oup.txt',
            './week2_test/standard_arr_expected.txt',
            0.5,
            false,
            true,
            Array(2..11)
        ))

        assert(Interactive.test_match(
            @@array_sort,
            './week2_test/mixed_arr_inp.txt',
            './week2_test/mixed_arr_oup.txt',
            './week2_test/mixed_arr_expected.txt',
            0.5,
            false,
            true,
            Array(2..11)
        ))

        assert(Interactive.test_match(
            @@array_sort,
            './week2_test/empty_arr_inp.txt',
            './week2_test/empty_arr_oup.txt',
            './week2_test/empty_arr_expected.txt',
            1,
            false,
            true,
            Array(2..5)
        ))
    end

    def test_formatted_table
        assert(Interactive.test_text_align(
            @@table_of_contents,
            './week2_test/table_oup.txt',
            './week2_test/table_expected.txt'
        ))
    end
end