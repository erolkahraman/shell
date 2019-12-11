#!/bin/bash

# function
multiply(){
  result = $(( $1-$2 ))
  return $result
}
multiply "$1" "$2"
echo $multiply
