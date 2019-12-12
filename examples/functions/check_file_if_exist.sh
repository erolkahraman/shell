#!/bin/bash

check_file(){
  if [ -e t.txt ]; then
    echo "Dosya mevcut..."
  else
    echo "Dosya mevcut degil..."
  fi
}

check_file
