.model flat, STDCALL
.386

.code
; test push and pop
main proc
	push eax
	mov eax, 0
	pop eax
	ret
main endp
end main 
