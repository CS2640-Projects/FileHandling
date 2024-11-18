#Practice opening, reading from, writing to, and closing files.
#John Stewart
#CS2640
#11/17/2024
#Github Repo: https://github.com/CS2640-Projects/FileHandling


.data
fileName: .asciiz "gradedItems.txt"
newFile: .asciiz "cs2640Items.txt"
printToIO: .asciiz "Text read from gradedItems.txt:\n"
aBuffer: .space 512

.text

main:

	#Open the file gradedItems.txt
	li $v0, 13
	la $a0, fileName
	li $a1, 0
	li $a2, 0
	syscall
	
	move $t0, $v0
	
	#Create cs2640Items.txt
	li $v0, 13
	la $a0, newFile
	li $a1, 1
	li $a2, 2
	syscall
	
	move $t1, $v0
		
printItems:
	#read gradedItems text
	li $v0, 14
	move $a0, $t0
	la $a1, aBuffer
	li $a2, 512
	syscall
	
	move $t2, $v0
	beqz $t2, fileClose
	
	#Write to cs2640Items.txt
	li $v0, 15
	move $a0, $t1
	la $a1, aBuffer
	move $a2, $t2
	syscall
		  
	li $v0, 4
	la $a0 printToIO
	syscall
	
	li $v0, 4
	la $a0 aBuffer
	syscall

	  
	
	
fileClose:
	#close gradedItems.txt
	li $v0, 16
	move $a0, $t0
	syscall
	
	#close cs2640Items.txt
	li $v0, 16
	move $a0, $t1
	syscall
	
	#Exit
	li $v0, 10
	syscall
	