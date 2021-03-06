# A helper class written to test interactive programs for Engineering 98.

# AUTHOR: Paul Shao

require 'timeout'
require 'stringio'

class Interactive
    # The primary method for testing interactive programs for the scope of this course.
    # @param test_file -> the .rb file containing the program to test on
    # @param inp -> the .txt file with the given input from the instructor's end
    # @param oup -> the .txt file with the output that whatever is printed to the console
    # will be redirected to
    # @param expected_oup -> the .txt file with the expected output
    # @param time_limit -> (in seconds) the time constraint to place on the program when
    # it is being run. Should be used primarily to check for infinite loop or unhandled exceptions.
    # @param gr_modified -> true IFF it is for testing the deaf grandma or its extension program.
    # The method has an additional clause for handling random integers generated in this range.
    # @return true IFF all lines of output produced by the given program exactly match all of those
    # from the expected output.

    @@NUM_PATTERN = /\d+\.?\d+/
    def self.test_num_match_only(test_file, oup, expected_oup, time_limit, multiple_ans, required_input, inp)
        if required_input
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
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
                actual_number = curr_actual.scan(@@NUM_PATTERN).map {|x| x.to_f }
                expected_number = curr_expected.scan(@@NUM_PATTERN).map {|y| y.to_f }
                unless actual_number.any?
                    next
                end
                if multiple_ans
                    num = actual_number[0]
                    unless expected_number.include?(num)
                        return false
                    end
                else
                    unless (expected_number & actual_number).any?
                        return false
                    end
                end
            end
        rescue Timeout::Error
            puts "Error: your method is taking too long to run."
            return false
        end
        return true
    end

    def self.test_partial_str_match(test_file, inp, oup, target, time_limit)
        cmd = "ruby #{test_file} < #{inp} > #{oup}"
        begin
            output = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            i = 0
            while i < actual.size
                i += 1
                curr_actual = actual.next.strip
                if curr_actual.include?(target)
                    return true
                end
            end
            rescue Timeout::Error
            return false
        end
        return false
    end

    def self.test_complete_partial_match(test_file, inp, oup, expected, time_limit, require_input)
        if require_input
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        begin
            output = Timeout::timeout(time_limit) do
                system(cmd)
            end
            compare = File.readlines(expected).each
            actual = File.readlines(oup).each
            i = 0
            while i < compare.size
                i += 1
                compareTo = compare.next.strip
                target = actual.next.strip
                if actual.eql?("")
                    break
                end
                unless target.include?(compareTo)
                    return false
                end
            end
            rescue Timeout::Error
            return false
        end
        return true
    end

    def self.test_text_align(test_file, oup, expected_oup)
        cmd = "ruby #{test_file} > #{oup}"
        system(cmd)
        actual = File.readlines(oup).each
        expected = File.readlines(expected_oup).each
        adjustment = actual.next.size
        i = 1
        while i < actual.size - 9
            i += 1
            curr_actual = actual.next
        end
        until i >= actual.size
            i += 1
            curr_actual = actual.next.strip
            if curr_actual.size - (adjustment - 2) > 10
                return false
            end
            shrinked = curr_actual.gsub(/\s+/, "").downcase
            curr_expected = expected.next.strip
            unless shrinked.eql?(curr_expected)
                return false
            end
        end
        return true
    end

    def self.edit_distance(first, second)
        first_len = first.length
        second_len = second.length
        return first_len if second_len == 0 or second.nil?
        return second_len if first_len == 0 or first.nil?
        dp = Array.new(first_len + 1) {Array.new(second_len + 1)}
        (0..first_len).each {|i| dp[i][0] = i}
        (0..second_len).each {|j| dp[0][j] = j}
        (1..second_len).each do |j|
            (1..first_len).each do |i|
                dp[i][j] = if first[i - 1] == second[j - 1]
                    dp[i - 1][j - 1]
                else
                    [dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1] + 1].min
                end
            end
        end
        dp[first_len][second_len]
    end

    def self.test_match(test_file, inp, oup, expected_oup, time_limit, gr_modified, required_input, lines)
        if required_input
            cmd = "ruby #{test_file} < #{inp} > #{oup}"
        else
            cmd = "ruby #{test_file} > #{oup}"
        end
        error_tracker = File.open("errors.txt","a")
        error_tracker.write("Testing errors for #{test_file} \n")
        begin
            output = Timeout::timeout(time_limit) do
                system(cmd)
            end
            actual = File.readlines(oup).each
            expected = File.readlines(expected_oup).each
            i = 0
            while i < actual.size
                i += 1
                if lines.include?(i)
                    curr_actual = actual.next.strip
                    curr_expected = expected.next.strip
                    while curr_expected.eql?("")
                        curr_expected = expected.next.strip
                    end
                    while curr_actual.eql?("")
                        curr_actual = actual.next.strip
                        i += 1
                    end
                    if curr_expected.match?(@@NUM_PATTERN)
                        unless assert_num_equal(curr_actual, curr_expected, 0.0001)
                            error_tracker.write("Match Error: Expected #{curr_expected.stirp} , but got#{curr_actual.strip} \n")
                            error_tracker.close
                            return false
                        end
                    else
                        ces = curr_expected.gsub(/\s+/, "").downcase
                        cas = curr_actual.gsub(/\s+/, "").downcase
                        unless edit_distance(ces, cas) <= 4
                            error_tracker.write("Match Error: Expected #{curr_expected} , but got#{curr_actual} \n")
                            error_tracker.close
                            return false
                        end
                    end
                    if gr_modified
                        if curr_actual[0..1].eql?("NO")
                            unless grandma_test(curr_actual, curr_expected)
                                error_tracker.write("Match Error: Expected #{curr_expected.stirp} , but got#{curr_actual.strip} \n")
                                error_tracker.close
                                return false
                            end
                        end
                    end
                end
            end
            rescue Timeout::Error
            error_tracker.write("Time Limit Exceeded Error: there might be an infinite loop within. \n")
            return false
        end
        error_tracker.write("No exceptions found.")
        return true
    end

    # Helper method written to check if two string of numbers are equal to each other (or
    # the absolute value of their difference is less than or equal to the given threshold).
    def self.assert_num_equal(first_num_str, second_num_str, threshold)
        first_num = first_num_str.to_f
        second_num = second_num_str.to_f
        return (first_num - second_num).abs <= threshold
    end

    # Helper method written to check specifically for the deaf_grandma.rb test case.
    # Checks if the first half of the string matches what we expect and the output random year
    # is within the given range.
    def self.grandma_test(curr_actual, curr_expected)
        curr_actual_first_half = curr_actual[0..13].gsub(/\s+/, "").downcase
        curr_expected_first_half = curr_expected[0..13].gsub(/\s+/, "").downcase
        unless edit_distance(curr_actual_first_half, curr_expected_first_half) <= 3
            return false
        end
        curr_actual_year = curr_actual[14..17].to_i
        unless in_range(curr_actual_year, 1930, 1950)
            return false
        end
        return true
    end

    # Helper method written to check if 2 strings are equal.
    def self.assert_equal(s1, s2)
        unless s1.eql?(s2)
            puts "Error: Unmatched output. Expecting #{s1}, but got #{s2}."
        end
    end

    # Helper method written to check if a given number is in the range [low, high].
    def self.in_range(number, low, high)
        return number >= low && number <= high
    end

end