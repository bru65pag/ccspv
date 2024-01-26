module main


struct Stack[T] {
    mut:
    elements []T
}


fn (mut s Stack[T]) push[T](item T) {
    s.elements << item
}

fn (mut s Stack[T]) pop[T]() ?T {
    if s.elements.len== 0 {
        return none
    }
    return s.elements.pop()
}

fn (s Stack[T]) print() {
    println(s)
}

fn hanoi[T](mut begin Stack[T], mut end Stack[T], mut temp Stack[T], n int) {
    if n == 1 {
        end[T].push(begin[T].pop() or {panic('empty stack')})
    } else {
        hanoi[T](mut begin, mut temp, mut end, n-1)
        hanoi[T](mut begin, mut end, mut temp, 1)
        hanoi[T](mut temp, mut end, mut begin, n-1)
    }
    println('${begin} , ${end} , ${temp}')
}

fn main() {
    num_discs := 3
    mut tower_a := Stack[int]{}
    mut tower_b := Stack[int]{}
    mut tower_c := Stack[int]{}
    for i in 1..num_discs+1 {
        tower_a.push(i)
    }
    hanoi(mut tower_a, mut tower_c, mut tower_b, 3)
}
