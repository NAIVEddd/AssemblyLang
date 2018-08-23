; factorial
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data

.code
factorial proc
	push ebp
	mov ebp, esp
	
	mov ebx, [ebp + 8]
	cmp ebx, 1
	jnz elseProc
	mov eax, 1
	jmp procEnd

	elseProc:
	dec ebx
	push ebx
	call factorial
	mov ebx, [ebp + 8]
	cdq
	mul ebx

	procEnd:
	pop ebp
	ret 4
factorial endp

main proc uses eax ebx ecx
	push 10
	call factorial

	push 0
	call ExitProcess
main endp
end main

