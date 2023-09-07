module main

struct Person {
	name string
	age int
}

struct Employee {
	Person
	email string
}

fn main() {
	println('Hello World!')
	mut s := sum(1, 2)
	println("the sum if ${s}")
	s = sum(3, 4)
	println(s)

	n := 999_999_999
	println(n)

	f := 999.165165
	println("f is ${f:.2}")


	mut arr := [1, 2, 3, 4, 5]
	println(arr)
	arr << 6
	println(arr)
	// arr << "hello" // error
	// println(arr)

	// do not reallocate with cap
	mut pre_arr := []int{len: 10, cap: 15, init: index}
	pre_arr << 1
	pre_arr << 2
	println(pre_arr)

	mut a := [][]int{len: 10, cap: 15, init: [1,2,3]}
	println(a)

	mut persons := []Person{}

	persons << Person{name: "John", age: 20}
	persons << Person{name: "Jane", age: 27}
	p := Person{name: "Jack", age: 22}
	persons << p

	persons.sort(a.age > b.age)

	println(persons)

	persons_over_21 := persons.filter(fn (p Person) bool {
		return p.age > 21
	})

	wow := persons.map(fn (p Person) Employee {
		return Employee{Person: p, email: "wow"}
	})
}


fn sum(a int, b int) int {
	return a + b
}