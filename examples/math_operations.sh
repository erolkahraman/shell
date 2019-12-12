#!/bin/bash

echo -n "First number: "
read first_number
echo -n "Second number: "
read second_number

echo "Sum of $first_number and $second_number is $(( $first_number + $second_number))"
echo "Sum of $first_number and $second_number is $( expr $first_number + $second_number )"
