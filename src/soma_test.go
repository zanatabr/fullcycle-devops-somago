package main

import "testing"

func TestSoma_deveResultar6(t *testing.T) {
	got := soma(3, 3)
	want := 6

	if got != want {
		t.Errorf("soma(3,3) \n got: %v \n want: %v \n", got, want)
	}
}

func TestSoma_deveResultar7(t *testing.T) {
	got := soma(3, 4)
	want := 7

	if got != want {
		t.Errorf("soma(3,3) \n got: %v \n want: %v \n", got, want)
	}
}
