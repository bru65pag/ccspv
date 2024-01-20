module main

fn main() {
	mut f := u64(10)
	println('fib5(${f}10) = ${fib5(f)}')
}

fn fib5(n u64) u64 {
	if  n == 0 {
		return n
	}
	mut last := u64(0)
	mut next := u64(1)
	for _ in 1..n {
		last, next = next, last+next
	}
	return next
}
