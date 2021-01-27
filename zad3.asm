# kalkulator Adrian Juszczak WSB Informatyka sem 3, niestacjonarne

.data 

space:.asciiz " "
welcome0:.asciiz"\n\n Select what would you like to do: \n"
welcome:.asciiz"1.Multiplication\n2. Addition\n\n"
message1:.asciiz " Type first number : "
message2:.asciiz " Type second number : "
message3:.asciiz " Type third number : "
message4:.asciiz "Wynik: " 

.text

main:
	
	li $v0, 4
	la $a0,welcome0
	syscall	#print message for user
	
	li $v0, 4
	la $a0,welcome
	syscall	#print list of operations
	
	li $v0,5
	syscall
	move $s2,$v0	#recieve user choice
	
	
main_loop:	
		beq $s2,9,main_exit	#if user choice = 9 , branch to exit
		beq $s2,1,mnozenie	#if not 1 branch
		
		
mnozenie: 

    	
    
   		li $v0,4
    		la $a0,message1		#print (enter first number :)
    		syscall
    
    		li $v0, 6			#scan first number
    		syscall			
    		mov.d $f1,$f0		#transfer value to $f4
    
    		li $v0,4
   		la $a0,message2		#print (enter second number :)
    		syscall
    
    		li $v0,6			#scan second number
    		syscall			
   		mov.d $f2,$f0		#transfer value to $f6
   		
   		li $v0,4
   		la $a0,message3		#print (enter third number :)
    		syscall
    
    		li $v0,6			#scan third number
    		syscall			
   		mov.d $f3,$f0		#transfer value to $f6
   		
   		mul.s $f4, $f1, $f2
   		mflo $s0
    
    
 		la $a0, message4 # ladowanie do rejestru a0 
 		li $v0, 4
 		syscall 
    		
    		
    		mul.s $f8,$f4,$f6		#do multiplication equation


    		li $s0,1			#make flag equal 1
    
    	
    		
    		
dodawanie:

		
main_exit:	# exit program
	
		li $v0,10 # close program
		syscall
		
	