require 'test/unit'
require './Interactive'

class Week1Test < Test::Unit::TestCase
    @@age_in_seconds =  './week1/ch02/age_in_seconds.rb'
    @@author_age =  './week1/ch02/author_age.rb'
    @@hours_in_year = './week1/ch02/hours_in_year.rb'
    @@minutes_in_decade = './week1/ch02/minutes_in_decade.rb'
    @@bigger_better = './week1/ch05/bigger_better_favorite_number.rb'
    @@greeting = './week1/ch05/full_name_greeting.rb'

    def test_age_in_seconds
        assert(Interactive.test_num_match_only(
            @@age_in_seconds,
            './week1_test/age_in_seconds_oup.txt',
            './week1_test/age_in_seconds_expected.txt',
            1,
            false,
            false,
            ''
        ))
    end

    def test_author_age
        assert(Interactive.test_num_match_only(
            @@author_age,
            './week1_test/author_age_oup.txt',
            './week1_test/author_age_expected.txt',
            1,
            false,
            false,
            ''
        ))
    end

    def test_hours_in_year
        assert(Interactive.test_num_match_only(
            @@hours_in_year,
            './week1_test/hours_in_year_oup.txt',
            './week1_test/hours_in_year_expected.txt',
            1,
            true,
            false,
            ''
        ))
    end

    def test_minutes_in_decade
        assert(Interactive.test_num_match_only(
            @@minutes_in_decade,
            './week1_test/minutes_in_decade_oup.txt',
            './week1_test/minutes_in_decade_expected.txt',
            1,
            true,
            false,
            ''
        ))
    end

    def test_bigger_better_favorite_number
        assert(Interactive.test_num_match_only(
            @@bigger_better,
            './week1_test/bigger_better_oup_1.txt',
            './week1_test/bigger_better_expected_1.txt',
            1,
            false,
            true,
            './week1_test/bigger_better_inp_1.txt'
        ))
        assert(Interactive.test_num_match_only(
            @@bigger_better,
            './week1_test/bigger_better_oup_2.txt',
            './week1_test/bigger_better_expected_2.txt',
            1,
            false,
            true,
            './week1_test/bigger_better_inp_2.txt'
        ))
    end

    def test_greeting
        assert(Interactive.test_match(
            @@greeting,
            './week1_test/greeting_inp_1.txt',
            './week1_test/greeting_oup_1.txt',
            './week1_test/greeting_expected_1.txt',
            1,
            false,
            true,
            [4]
        ))
        assert(Interactive.test_match(
            @@greeting,
            './week1_test/greeting_inp_2.txt',
            './week1_test/greeting_oup_2.txt',
            './week1_test/greeting_expected_2.txt',
            1,
            false,
            true,
            [4]
        ))
    end

end

