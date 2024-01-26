module main

import rand


fn byte_array_to_u64 (bytes []u8) u64 {
    mut result := u64(0)
    for i:=0 ; i<bytes.len ; i++ {
        shifted := u64(bytes[i]) << i*8
println('------------------------')
println('${i*8}')
        println('${shifted:024b}')
        result |= shifted
        println('${result:024b}')


    }
    return result
}

fn random_key(length u8) u64 {
    if length>8 {
        panic('key length cannot be more than 8 bytes')
    }

    key := rand.bytes(length) or {panic('rand.bytes failed')}
for i in 0..key.len {
    println('${key[i]:08b}')
}
    return byte_array_to_u64(key)
}

fn main() {
    key := random_key(3)
    println('key = ${key:024b}')
}
