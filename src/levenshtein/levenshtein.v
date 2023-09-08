module levenshtein

fn min(a int, b int, c int) int {
	if a < b {
		if a < c {
			return a
		} else {
			return c
		}
	} else {
		if b < c {
			return b
		} else {
			return c
		}
	}
}

pub fn distance(a string, b string) int{
	if a == b {
		return 0
	}

	m := a.len
	n := b.len

	if m == 0 {
		return n
	}

	if n == 0 {
		return m
	}

	mut arr := [][]int{len: m+1, init: []int{len: n+1, init: 0}}

	for i := 0; i <= m; i++ {
		arr[i][0] = i
	}

	for j := 0; j <= n; j++ {
		arr[0][j] = j
	}

	mut cost := 0

	for i := 1; i <= m; i++ {
		for j := 1; j <= n; j++ {
			if a[i - 1] == b[j - 1] {
				cost = 0
			} else {
				cost = 1
			}

			arr[i][j] = min(
				arr[i-1][j] + 1,
				arr[i][j-1] + 1,
				arr[i-1][j-1] + cost)
		}
	}

	return 2
}