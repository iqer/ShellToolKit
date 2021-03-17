package main

import (
	"fmt"
	"time"
)

func main() {
	n := 100000000
	start := time.Now()
	function3(n)
	tc := time.Since(start)

	fmt.Println(tc)
}

func function1(n int) {
	k := 0
	for i := 0; i < n; i++ {
		k++
	}
}

func function2(n int) {
	k := 0
	for i := 0; i < n; i++ {
		{
			for j := 0; j < n; j++ {
				k++
			}
		}
	}
}

func function3(n int) {
	k := 0
	for i := 0; i < n; i++ {
		{
			for j := 1; j < n; j = j * 2 {
				k++
			}
		}
	}
}
