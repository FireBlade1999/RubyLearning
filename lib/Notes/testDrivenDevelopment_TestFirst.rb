#
#
# Test first is a programming tactic where you write an automated test that 
# pretends the code works, then you write the code to make the test actually 
# work. This method works when you can’t visualize how the code is implemented, 
# but you can imagine how you have to work with it. For example, if you know 
# how you need to use a new class in another module, but you don’t quite know 
# how to implement that class yet, then write the test first.
#
# You are going to take a test I give you, and then use it to write the code 
# that makes it work. To do this exercise you’re going to follow this procedure:
#
# 1. Create one small part of the test I give you.
#
# 2. Make sure it runs and fails so you know that the test is actually confirming 
# a feature works.
#
# 3. Go to your source file lexicon.rb and write the code that makes this test pass.
#
# 4. Repeat until you have implemented everything in the test.
#
# When you get to #3 it’s also good to combine our other method of writing code:
#
# 1. Make the “skeleton” function or class that you need.
#
# 2. Write comments inside describing how that function works.
#
# 3. Write the code that does what the comments describe.
#
# 4. Remove any comments that just repeat the code.
#
# This method of writing code is called “psuedo code” and works well if you don’t 
# know how to implement something, but you can describe it in your own words.
#
# Combining the “test first” with the “psuedo code” tactics we then have this simple 
# process for programming:
#
# 1. Write a bit of test that fails.
#
# 2. Write the skeleton function/module/class the test needs.
#
# 3. Fill the skeleton with comments in your own words explaining how it works.
#
# 4. Replace the comments with code until the test passes.
#
# 5. Repeat.
#
# In this exercise you will practice this method of working by making a test I 
# give you run against the lexicon.rb module.
#
# See /test/Test_Examples/TestName.rb
# 
# eg
# 1. Write the require at the top. Get that to work.
# 2. Create an empty version of the first test case test_directions. Make sure that runs.
# 3. Write the first line of the test_directions test case. Make it fail.
# 4. Go to the lexicon.rb file, create an empty scan function.
# 5. Run the test, make sure scan is at least running, even though it fails.
# 6. Fill in psuedo code comments for how scan should work to make test_directions pass.
# 7. Write the code that matches the comments until test_directions passes.
# 8. Go back to test_directions and write the rest of the lines.
# 9. Back to scan in lexicon.rb and work on it to make this new test code pass.
# 10. Once you’ve done that you have your first passing test, and you move on to the next test.
#
