CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
WINCPATH='".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"'

# set -e

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
javac -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ";lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples