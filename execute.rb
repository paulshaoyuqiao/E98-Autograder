# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = ["test_age_in_seconds", "test_author_age", "test_hours_in_year", "test_minutes_in_decade",
  "test_bigger_better_favorite_number", "test_greeting"]
  def self.run_all_test
    @@test_method.each { |method|
        test_output = `ruby week1_test.rb -n #{method} --runner console --verbose=progress`
        failed_tests = test_output.chomp.split('').count('F')
        passed_tests = test_output.chomp.split('').count('.')
        actual_method = method[5..method.length - 1]
        puts(actual_method, passed_tests, failed_tests)
    }
  end
end
