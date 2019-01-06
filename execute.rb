# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = [['ninety_nine_bottles'], ['deaf_grandma1', 'deaf_grandma2', 'deaf_grandma3', 'deaf_grandma4'], ['extended_deaf_grandma1', 'extended_deaf_grandma2', 'extended_deaf_grandma3', 'extended_deaf_grandma4'],['leap_year_counter1', 'leap_year_counter2', 'leap_year_counter3'], ['arr_sort1', 'arr_sort2', 'arr_sort3'], ['table_of_contents']]
  def self.run_all_test
    i = 0
    while i < @@test_method.length
      failed_tests = 0
      passed_tests = 0
      inner_len = @@test_method[i].length
      j = 0
      while j < @@test_method[i].length
        method = @@test_method[i][j]
        test_output = `ruby week2_test.rb -n #{'test_'+method} --runner console --verbose=progress`
        failed_tests += test_output.chomp.split('').count('F')
        passed_tests += test_output.chomp.split('').count('.')
        j += 1
      end
      puts(@@test_method[i][0].tr("0-9",""), passed_tests, failed_tests)
      i += 1
    end
  end
end
