module main

fn main() {
	println(fib1(15))
}

fn fib1(n u64) u64 {
	println('call fib1(${n})')
	return fib1(n-1) + fib1(n-2)
}
