require 'test/unit'
require './Interactive'

class Week1Test < Test::Unit::TestCase
    @@age_in_seconds =  './week1/ch02/age_in_seconds.rb'
    @@author_age =  './week1/ch02/author_age.rb'
    @@hours_in_year = './week1/ch02/hours_in_year.rb'
    @@minutes_in_decade = './week1/ch02/minutes_in_decade.rb'

    def test_age_in_seconds
        assert(Interactive.test_num_match_only(
            @@age_in_seconds,
            './week1_test/age_in_seconds_oup.txt',
            './week1_test/age_in_seconds_expected.txt',
            1,
            false
        ))
    end

    def test_author_age
        assert(Interactive.test_num_match_only(
            @@author_age,
            './week1_test/author_age_oup.txt',
            './week1_test/author_age_expected.txt',
            1,
            false
        ))
    end

    def test_hours_in_year
        assert(Interactive.test_num_match_only(
            @@hours_in_year,
            './week1_test/hours_in_year_oup.txt',
            './week1_test/hours_in_year_expected.txt',
            1,
            true
        ))
    end

    def test_minutes_in_decade
        assert(Interactive.test_num_match_only(
            @@minutes_in_decade,
            './week1_test/minutes_in_decade_oup.txt',
            './week1_test/minutes_in_decade_expected.txt',
            1,
            true
        ))
    end
end

