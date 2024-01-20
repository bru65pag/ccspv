module main

fn main() {
	println('fib2(15) = ${fib2(40)}')
}

fn fib2(n u64) u64 {
	if n<2 {
		return n
	}
	return fib2(n-1) + fib2(n-2)
}
