#!/usr/bin/bash

if [ -f todo.new ]; then
  rm todo.new
fi
if [ -f someday.tmp ]; then
  rm someday.tmp
fi
if [ -f someday.new ]; then
  rm someday.new
fi

while read textline; do
  echo "$textline" | grep "+Project" > /dev/null
  hasProject=$?
  if [[ $hasProject -eq 0 ]]; then
    resultEnd=1
    while read projectline; do
      echo "$textline" | grep $projectline > /dev/null
      result=$?
      resultEnd=$[$result*$resultEnd]
    done < projects.txt
    if [[ $resultEnd -eq 1 ]]; then
      project=""
      [[ $textline =~ .*\+(Project.*)$ ]] && project=${BASH_REMATCH[1]}
      echo "$textline" >> "pplan_$project.txt"
      echo "$project" >> someday.tmp
      # empty line so it doesn't show up in the todo.txt file
      textline=""
    fi
    if [ -s someday.tmp ]; then
      cat someday.tmp someday.txt | uniq > someday.new
    fi
  fi
  if [[ -n $textline ]]; then
    echo "$textline" >> todo.new
  fi
done < todo.txt
if [ -s someday.new ]; then
  mv someday.new someday.txt
fi
if [ -s todo.new ]; then
  mv todo.new todo.txt
fi
if [ -f someday.tmp ]; then
  rm someday.tmp
fi
