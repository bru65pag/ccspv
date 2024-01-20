module main

struct Gene {
    mut:
        table map[string]u8
        sequence string
        compressed u8
        b2l map[u8]string
}

fn (mut g Gene) init(s string) {
    g.sequence = s
	g.table['A']=u8(0b00) 
	g.table['C']=u8(0b01)
	g.table['G']=u8(0b10)
	g.table['T']=u8(0b11)
    g.b2l[0b00]='A'
    g.b2l[0b01]='C'
    g.b2l[0b10]='G'
    g.b2l[0b11]='T'
}

fn (mut g Gene) compress() {
    for l in g.sequence {
        g.compressed <<= 2
        g.compressed |= g.table[l.ascii_str()]
    }
}

fn (mut g Gene) uncompress() string {
    mut uncompressed := ''
    mut x:=g.compressed
    for i:=0; i<sizeof(g.compressed)*8; i+=2 {
       y := x >> i & 0b00000011
       z := g.b2l[y]
       uncompressed =  z + uncompressed
    } 
   return uncompressed 
}
    
fn main() {
    mut gene := Gene{}
    gene.init('ACGT')
    println('gene = ${gene.sequence}')
    gene.compress()
    println('gene.compressed = ${gene.compressed:08b}')
    gene.uncompress()
    println('uncompressed = ${gene.uncompress()}')
}
