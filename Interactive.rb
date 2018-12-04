# A helper class written to test interactive programs for Engineering 98.
# AUTHOR: Paul Shao

require 'timeout'

class Interactive
    
    # The primary method for testing interactive programs for the scope of this course.
    # @param test_file -> the .rb file containing the program to test on
    # @param inp -> the .txt file with the given input from the instructor's end
    # @param oup -> the .txt file with the output that whatever is printed to the console will be redirected to 
    # @param expected_oup -> the .txt file with the expected output
    # @param time_limit -> (in seconds) the time constraint to place on the program when it is being run. Should be used primarily to check for infinite loop or unhandled exceptions. 
    # @param gr_modified -> true IFF it is for testing the deaf grandma or its extension program. The method has an additional clause for handling random integers generated in this range. 
    # @return true IFF all lines of output produced by the given program exactly match all of those from the expected output. 
    # Comments will be provided to show the students which part of their programs exactly went wrong. (in form of line number in the output)
    def self.test_match(test_file, inp, oup, expected_oup, time_limit, gr_modified)
        cmd = "ruby #{test_file} < #{inp} > #{oup}"
        begin
            output = Timeout::timeout(time_limit) do
                system(cmd)
            end 
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            i = 0
            while i < actual.size
                i += 1
                curr_actual = actual.next.strip
                curr_expected = expected.next.strip
                if !gr_modified
                    assert_equal(curr_expected, curr_actual)
                elsif curr_actual[0..1].eql?("NO")
                    curr_actual_first_half = curr_actual[0..13]
                    curr_expected_first_half = curr_expected[0..13]
                    assert_equal(curr_expected_first_half, curr_actual_first_half)
                    curr_actual_year = curr_actual[14..17].to_i
                    in_range(curr_actual_year, 1930, 1950)
                end
            end
            rescue Timeout::Error 
            raise "Error: your method is taking too long to run. Check your codes to see if there is an uncaught infinite loop."
        end
        return true
    end

    # Helper method written to check if 2 strings are equal. 
    def self.assert_equal(s1, s2)
        if !(s1.eql?(s2))
            raise "Error: Unmatched output. Expecting #{s1}, but got #{s2}."
        end
    end

    # Helper method written to check if a given number is in the range [low, high].
    def self.in_range(number, low, high)
        if !(number >= low && number <= high)
            raise "Error: Unmatched range. Expecting a number between #{low} and #{high}, but got #{number}."
        end
    end 

end
