# Zad 1. 

.data 

msgWelcome:	.asciiz "Zadanie 1"
firstDig: 	.asciiz "Podaj liczbe a: "
secondDig: 	.asciiz "Podaj liczbe b: "
newline:	.asciiz "\n"
msgResult:	.asciiz "Wynik = "


.text

	la $a0, msgWelcome	
	li $v0, 4		# parametr 4 wywolania printa 
	syscall 
	
	li $v0, 4      		# odstep
	la $a0, newline      
	syscall
	
	la $a0, firstDig 	# print
	li $v0, 4
	syscall 
	
	li $v0, 5		# wczytanue znaku z klawiatury
	syscall
	move $t0, $v0		# przeniesienie wartosci wczytanej z klawiatury do rejestru t0
	
	li $v0, 4      		# odstep
	la $a0, newline      
	syscall
	
	la $a0, secondDig 	# print	
	li $v0, 4
	syscall
	
	li $v0, 5		# wczytanue znaku z klawiatury
	syscall
	move $t1, $v0		# przeniesienie wartosci wczytanej z klawiatury do rejestru t1
	
	addi $sp, $sp, -8 	# tworzenie miejsca na stosie 
	sw $t0, 0($sp)		# zapisanie t0 na stosie
	sw $t1, 4($sp)		# zapisanie t0 na stosie
	
	
	add $s1, $t0, $t1 	# (a + b) - wynik zapisany w rejestrze $s1
	
	mul $s2, $s1, 7 	# 7 * (a + b) / - wynik zapisany w rejestrze $s2
	
	mul $s3, $t0, 2		# 2 * a / - wynik zapisany w rejestrze $s3
	
	mul $s4, $t1, 2		# 2 * b / - wynik zapisany w rejestrze $s4
	
	# add s2 + s3 + s4 
	
	add $s5, $s2, $s3	# s2 + s3 / działania rozdzielam na 2 czesci, wynik pierwszej czesci zapisany w rejestrze $s5
	
	add $s6, $s4, $s5	# add s5 + s4 / działania rozdzielam na 2 czesci, wynik drugiej czesci zapisany w rejestrze $s6
	
	la $a0, msgResult	# print string - mowi nam to 4 
	li $v0 , 4
	syscall
	
	li $v0, 1	# print wyniku 
	move $a0, $s6
	syscall 
	