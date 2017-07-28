#!/bin/env bats

@test "Testing newton tool" {
   echo newton
}

@test "Check for latest version of bash-snippets on update" {
  run newton update
  [ "$status" -eq 0 ]
  [ "$output" = "Bash-Snippets is already the latest version" ]
}

@test "The -h option should print usage" {
  run newton -h
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Newton" ]
}

@test "Testing newton simplify for [[2x^2]+7]*[4x^2]" {
  run newton simplify [[2x^2]+7]*[4x^2]
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "================================" ]
  [ "${lines[3]}" = "|Result: 8 x^4 + 28 x^2" ]
}

@test "Get the tools version with -v" {
  run newton -v
  [ "$status" -eq 0 ]
  result=$( echo $(newton -v) | grep -Eo "Version")
  [ "$result" = "Version" ]
}
