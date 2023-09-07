module main

import net.http
import sync
import time

fn task(mut wg sync.WaitGroup, id int) {
	start := time.ticks()

	http.get("https://google.com") or {}

	println("Task ${id} took ${time.ticks() - start} ms")
	wg.done()
}

fn main() {

	mut wg := sync.new_waitgroup()
	wg.add(16)

	for i in 0 .. 15 {
		go task(mut wg, i)
	}

	wg.wait()
}