# Helper class created to run all the given tests per method.
# @return (in the form of stdout)  per line: the name of the test,
# the number of passed tests, and the number of failed tests.

#AUTHOR: Paul Shao

class Exec
  @@test_method = [['ask1', 'ask2'], ['old_roman0', 'old_roman1', 'old_roman2', 'old_roman3', 'old_roman4'], ['new_roman0', 'new_roman10', 'new_roman1', 'new_roman2', 'new_roman3', 'new_roman4', 'new_roman5']]
  def self.run_all_test
    i = 0
    while i < @@test_method.length
      failed_tests = 0
      passed_tests = 0
      inner_len = @@test_method[i].length
      j = 0
      while j < @@test_method[i].length
        method = @@test_method[i][j]
        test_output = `ruby week3_test.rb -n #{'test_' + method} --runner console --verbose=progress`
        failed_tests += test_output.chomp.split('').count('F')
        passed_tests += test_output.chomp.split('').count('.')
        j += 1
      end
      puts(@@test_method[i][0].tr("0-9",""), passed_tests, failed_tests)
      i += 1
    end
  end
end
