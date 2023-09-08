module main

import net.http
import sync
import time
import levenshtein
import strings

fn task(mut wg sync.WaitGroup, id int) {
	start := time.ticks()

	http.get("https://google.com") or {}

	println("Task ${id} took ${time.ticks() - start} ms")
	wg.done()
}

fn main() {
	bench_levenshtein()

	// mut wg := sync.new_waitgroup()
	// wg.add(16)

	// for i in 0 .. 15 {
	// 	go task(mut wg, i)
	// }

	// wg.wait()
}

fn bench_levenshtein() {
	mut start := time.ticks()

	for _ in 0 .. 100000 {
		strings.levenshtein_distance("kitten", "sitting")
		strings.levenshtein_distance("saturday", "sunday")
		strings.levenshtein_distance("sittin", "sitting")
		strings.levenshtein_distance("abacate", "abacate")
		strings.levenshtein_distance("abacate", "dauoishduiahsuidh")
	}

	println("Levenshtein native took ${time.ticks() - start} ms")

	start = time.ticks()

	for _ in 0 .. 100000 {
		levenshtein.distance("kitten", "sitting")
		levenshtein.distance("saturday", "sunday")
		levenshtein.distance("sittin", "sitting")
		levenshtein.distance("abacate", "abacate")
		levenshtein.distance("abacate", "dauoishduiahsuidh")
	}

	println("Levenshtein took ${time.ticks() - start} ms")
}