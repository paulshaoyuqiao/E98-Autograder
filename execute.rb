# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = %w(test_99_bottles test_deaf_grandma test_deaf_grandma_extended test_leap_year_counter test_array_sort test_formatted_table)
  def self.run_all_test
    @@test_method.each { |method|
        test_output = `ruby week2_test.rb -n #{method} --runner console --verbose=progress`
        failed_tests = test_output.chomp.split('').count('F')
        passed_tests = test_output.chomp.split('').count('.')
        actual_method = method[5..method.length - 1]
        puts(actual_method, passed_tests, failed_tests)
    }
  end
end
