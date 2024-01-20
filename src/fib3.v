module main

fn main() {
	mut m := {0:0, 1:1}
	mut f := 10
	println('fib3(${f}10) = ${fib3(f,mut &m)}')
}

fn fib3(n int, mut m &map[int]int) int {
	if n !in m { // testing if m[n] exists
		m[n] = fib3(n-1, mut &m) + fib3(n-2, mut &m)	
	}
	return m[n]
}
