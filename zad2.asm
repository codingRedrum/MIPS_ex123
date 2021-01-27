.data 

msgSumA: .asciiz "Suma pierwszej tablicy  = "
msgSumB: .asciiz "Suma drugiej tablicy = "
odstep: .asciiz "\n" 			# nowa linia
tab1: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
tab2: .word 0, 1, 2, 3, 4, 5
sizeOfArray: .word 10

.text 

.globl main 				

main:

la	$s0, tab1
la	$s1, tab2
li	$s2, 0            		# int i
li	$s3, 0           		# suma 1 tablicy
li	$s4, 0           		# suma 2 tablicy
lw  	$s5, sizeOfArray


petlaTab1:				# petla sumujaca wyniki z pierwszej tablicy

sltiu $t9, $s2, 10			# warunek petli
beq   $t9, $0,  koniecPetli1		# wiekszy rowna / warunek spelniony = koniecPetli1

lw    $s7, ($s0)			# zapisujemy tablice w rejestrze $s7
addu  $s3, $s3, $s7			# sumowanie elementow tablicy	

addi $s0, $s0, 4			# skoki po tablicy 4 bajty

addi $s2, $s2, 1			# inkrementacja
j petlaTab1
koniecPetli1:

li $s2, 0 		# i = 0

petlaTab2:				# petla sumujaca wyniki z pierwszej tablicy

sltiu $t8, $s2, 10			# warunek petli
beq   $t8, $0,  koniecPetli2		# wiekszy rowna / warunek spelniony = koniecPetli1

lw    $s6, ($s1)			# zapisujemy tablice w rejestrze $s7
add $s4, $s4, $s6			# sumowanie elementow tablicy	

addi $s1, $s1, 4			# skoki po tablicy 4 bajty

addi $s2, $s2, 1			# inkrementacja
j petlaTab2
koniecPetli2:



# wyswietlanie wynikow 
la	$a0, msgSumA	
li	$v0, 4
syscall

addu	$a0, $0, $s3	# suma 1 tablicy
li	$v0, 1
syscall

la	$a0, odstep
li	$v0, 4
syscall

la	$a0, msgSumB	
li	$v0, 4
syscall

add	$a0, $0, $s4	# suma 2 tablicy
li	  $v0, 1
syscall

li	$v0, 10		# wyjscie