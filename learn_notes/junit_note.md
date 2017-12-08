- [How to run JUnit test cases from the command line ](https://stackoverflow.com/questions/2235276/how-to-run-junit-test-cases-from-the-command-line)
```bash
# Maven way
# If you use Maven, you can run the following command to run all your test cases:

mvn clean test

# Or you can run a particular test as below

mvn clean test -Dtest=your.package.TestClassName
mvn clean test -Dtest=your.package.TestClassName#particularMethod


# Gradle way
# If you use Gradle, you can run the following command to run all your test cases:

gradle test

# Or you can run a particular test as below

gradle test --tests your.package.TestClassName
gradle test --tests your.package.TestClassName.particularMethod
```




