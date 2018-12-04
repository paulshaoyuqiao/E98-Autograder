# E98-autograder
#### Author: Paul Shao

To use, run `unit_test.rb`, it will invoke unit test and interactive test instances on different methods.

Demo:
**Unit Test for Static (One-time Input and Output) Methods**

`add.rb`

**Interactive Test**

`greet.rb`
`angry_grandma.rb`

### How it works for Interactive Test
It takes in the students' program, a given input in textfile, an empty textfile to store outputs by the program, and an expected
output in textfile. It will run the program with the test input in the textfile, redirect the output stream to the empty textfile,
and in the end, compare that against the expected output line by line. 
