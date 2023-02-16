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
cat Error.txt

grep -m 1 "testMergeRightEnd" Error.txt > Output.txt

echo 'Begin output'

cat Output.txt