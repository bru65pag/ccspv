module main


fn pi (terms int) f64 {
    mut pi := 0.0
    numerator := 4.0
    mut denominator := 1.0
    mut operator := 1.0
    for _ in 0..terms {
        pi += operator *(numerator/denominator)
        denominator += 2.0
        operator *= -1.0
    }
    return pi
}

fn main() {

    // pi = 4/1 - 4/3 + 4/5 -4/7 + 4/8 ...
    println(pi(400000))
}

