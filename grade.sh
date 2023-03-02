CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
WINCPATH='".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"'

rm -rf student-submission/
git clone $1 student-submission/
echo 'Finished cloning'
if [[ -f student-submission/ListExamples.java ]]
then
    cp ./TestListExamples.java student-submission/
    cp -r lib student-submission/
else
    echo 'File does not have right name/exist or wrong directory'
    exit
fi

cd student-submission

javac ListExamples.java

if [[ $? -ne 0 ]]
then
    echo 'List.Examples.java did not compile'
    exit
fi

javac -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" TestListExamples.java
java -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > Error.txt

if grep -wq "OK" Error.txt
then
    echo 'OK all tests passed: 100%'
    exit
fi

grep -m 1 "Tests run:" Error.txt > Output.txt
echo "Tests Failed:" >> Output.txt
grep -m 1 -w "TestListExamples" Error.txt >> Output.txt

cat Output.txt
