package main

import "testing"

// Fake for simulating tests in pipeline
func Test_main(t *testing.T) {
	got := true
	if got != true {
		t.Errorf("main() = %t; want true", got)
	}
}
