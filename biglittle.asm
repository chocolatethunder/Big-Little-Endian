;------------------------------------------------------
; Big to Little
; Author: Saurabh Tomar
; Written for CPSC355
; Description: This program moves the elements from an array
;				arranged in a bigEndian mem sequence to 32 bit
;				littleEndian word reversing the order of the bytes.
;------------------------------------------------------

INCLUDE Irvine32.inc

; Initialize the data
.DATA
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

.CODE
;------------------------------------------------------
; endian
; Takes an ethe bigEndian array and rearranges it into the
; littleEndian variable reversing the byte order to produce a
; 12345678 hexadecimal value for littleEndian variable.
; Recieves: 1 empty array
; Returns: 1 filled variable 
;------------------------------------------------------
endian PROC 
	
	; Move the first two array elements to produce 1234 in AX
	mov AH, BYTE PTR [bigEndian]
	mov AL, BYTE PTR [bigEndian+1]

	; Save that into littleEndian at offset 2
	mov WORD PTR [littleEndian+2], AX

	; Move the first two array elements to produce 1234 in AX
	mov AH, BYTE PTR [bigEndian+2]
	mov AL, BYTE PTR [bigEndian+3]

	; Save that into littleEndian at offset 0
	mov WORD PTR [littleEndian], AX

	exit 

endian ENDP
END endian
