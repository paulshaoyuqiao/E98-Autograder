# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = [
      ['arr_max1', 'arr_max2', 'arr_max3', 'arr_max4'],
      ['contains_char1', 'contains_char2', 'contains_char3', 'contains_char4', 'contains_char5'],
      ['count_arr1', 'count_arr2', 'count_arr3', 'count_arr4'],
      ['factorial1', 'factorial2', 'factorial3', 'factorial4'],
      ['sum_of_digits1', 'sum_of_digits2', 'sum_of_digits3', 'sum_of_digits4']
  ]
  def self.run_all_test
    i = 0
    while i < @@test_method.length
      failed_tests = 0
      passed_tests = 0
      inner_len = @@test_method[i].length
      j = 0
      while j < @@test_method[i].length
        method = @@test_method[i][j]
        test_output = `ruby week4_test.rb -n #{'test_' + method} --runner console --verbose=progress`
        failed_tests += test_output.chomp.split('').count('F')
        passed_tests += test_output.chomp.split('').count('.')
        j += 1
      end
      puts(@@test_method[i][0].tr("0-9",""), passed_tests, failed_tests)
      i += 1
    end
  end
end
