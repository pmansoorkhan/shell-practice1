

tell me what is variables  in shell scripting and how many ways we can pass it , give examples on it 

In Shell scripting, a variable is a name used to store a value such as text, numbers, file names, command output, or user input.

For example:

name="Mansoor"
echo "$name"

Output:

Mansoor
1. How to create a variable

The basic syntax is:

variable_name=value

Important: Do not put spaces around =.

Correct:

name="Mansoor"
age=25

Incorrect:

name = "Mansoor"

To access the value, use $:

echo "$name"
echo "$age"
Ways to pass variables in Shell Scripting

There are several common ways to provide values to a shell script.

1. Assigning a variable directly

You can assign a value inside the script.

#!/bin/bash

name="Mansoor"
city="Guntur"

echo "Name: $name"
echo "City: $city"

Output:

Name: Mansoor
City: Guntur
2. Passing variables as command-line arguments

You can pass values while executing the script.

Create test.sh:

#!/bin/bash

echo "Name: $1"
echo "Age: $2"
echo "City: $3"

Run:

sh test.sh Mansoor 25 Guntur

Output:

Name: Mansoor
Age: 25
City: Guntur

Here:

Variable	Meaning
$0	Script name
$1	First argument
$2	Second argument
$3	Third argument
$#	Number of arguments
$@	All arguments
$?	Exit status of previous command
$$	Current process ID

Example:

#!/bin/bash

echo "Script: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "All arguments: $@"

Run:

sh test.sh apple orange mango
3. Using read to get user input

This is another very common method.

#!/bin/bash

echo "Enter your name:"
read name

echo "Welcome $name"

Run:

sh test.sh

Output:

Enter your name:
Mansoor
Welcome Mansoor

You can also write:

read -p "Enter your name: " name
echo "Hello $name"
4. Passing variables through environment variables

You can define a variable before executing the script.

Example:

name="Mansoor" sh test.sh

Inside test.sh:

#!/bin/bash

echo "Name: $name"

Output:

Name: Mansoor

This is useful when you don't want to hard-code configuration values inside the script.

For example:

ENVIRONMENT="production" sh deploy.sh

Inside deploy.sh:

echo "Environment: $ENVIRONMENT"

Output:

Environment: production
5. Using export

You can export a variable so that child processes/scripts can access it.

Create:

export NAME="Mansoor"

Then:

sh test.sh

test.sh:

#!/bin/bash

echo "Name is $NAME"

Output:

Name is Mansoor

Without export, a normal shell variable is generally not available to child processes.

6. Passing command output into a variable

You can store the output of a command in a variable.

This is called command substitution.

hostname=$(hostname)
echo "$hostname"

Another example:

current_date=$(date)
echo "Current date: $current_date"

Another common example:

disk_usage=$(df -h / | tail -1)
echo "$disk_usage"
7. Passing variables to a function

Shell functions can receive arguments just like scripts.

#!/bin/bash

greet() {
    name=$1
    echo "Hello $name"
}

greet "Mansoor"

Output:

Hello Mansoor

Another example:

add() {
    a=$1
    b=$2

    echo "Sum: $((a + b))"
}

add 10 20

Output:

Sum: 30

Here:

$1 = 10
$2 = 20
8. Reading values from a file

You can also read values from a file into variables.

Suppose users.txt contains:

Mansoor
Ramesh
Suresh

You can use:

while read name
do
    echo "User: $name"
done < users.txt

Output:

User: Mansoor
User: Ramesh
User: Suresh

Here each line is assigned to the variable name.

9. Positional parameters

This is particularly important for DevOps/Shell scripting interviews.

Suppose:

#!/bin/bash

echo "Username: $1"
echo "Server: $2"
echo "Environment: $3"

Execute:

sh deploy.sh mansoor server01 production

Then:

$1 = mansoor
$2 = server01
$3 = production

You can think of it as:

deploy.sh    mansoor       server01       production
    $0          $1             $2              $3
10. Special variables

Shell also provides predefined variables.

Example:

#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Arguments count: $#"
echo "All arguments: $@"
echo "Process ID: $$"

Run:

sh test.sh Linux AWS

You might get:

Script name: test.sh
First argument: Linux
Second argument: AWS
Arguments count: 2
All arguments: Linux AWS
Process ID: 12345
Simple summary
Method	Example	Common use
Direct assignment	name="Mansoor"	Store values in script
Command-line argument	sh test.sh Mansoor	Pass values during execution
read	read name	Get interactive user input
Environment variable	NAME=Mansoor sh test.sh	Pass configuration
export	export NAME=Mansoor	Make variable available to child processes
Command substitution	date=$(date)	Store command output
Function argument	greet Mansoor	Pass values to functions
File input	read name < file	Process file data
Special variables	$1, $#, $@	Script arguments and metadata
A practical DevOps example

Suppose you have a deployment script:

#!/bin/bash

APP_NAME=$1
ENVIRONMENT=$2
VERSION=$3

echo "Application : $APP_NAME"
echo "Environment : $ENVIRONMENT"
echo "Version     : $VERSION"

Run:

sh deploy.sh payment-app production v2.5

Output:

Application : payment-app
Environment : production
Version     : v2.5

This pattern is very common in Linux administration, DevOps automation, CI/CD pipelines, and deployment scripts.