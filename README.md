# E98-autograder
#### Author: Paul Shao

To use, run `unit_test.rb`, it will invoke both the **static unit test and interactive test instances** on different methods.
______________________________________________________________________________________________________________________________
### Current Testing Parameters/Functionalities Supported:

* Interactive or Static (One-time) Input
* Time Limit
* Specific by-line Error Feedback

______________________________________________________________________________________________________________________________

### Demos:

**Unit Test for Static (One-time Input and Output) Methods**

`add.rb`

**Interactive Test**

`greet.rb`
`angry_grandma.rb`

### How it works for Interactive Test
It takes in the following 4 files, 
1. `students_program.rb`
2. `test_input.txt`
3. `test_output.txt`
4. `expected_output.txt`
Then, the interactive class will run the program with the test input in the textfile, redirect the output stream to the empty textfile, and in the end, compare that against the expected output line by line. 

