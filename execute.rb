# Helper class created to run all the given tests per method.
# @return (in the form of stdout) 
# per line: the name of the test, the number of passed test cases, the number of failed test cases

#AUTHOR: Paul Shao

class Exec
  @@test_method = ["test_add", "test_subtract"]
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
