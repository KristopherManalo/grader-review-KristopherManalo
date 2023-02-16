CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission

if [[ -f student-submission/ListExamples.java ]]
then
    cp ./TestListExamples.java student-submission/
else
    exit
fi

echo 'Finished cloning'

javac student-submission/*.java
java org.junit.runner.JUnitCore student-submission/TestListExamples