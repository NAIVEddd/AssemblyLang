; count length of a string.
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
source byte "hello world.!", 0

.code
;   one params : char * str
;       push offset string
;   return eax, if not a valid string, the eax equal to -1(0xFFFFFFFF).
Str_length proc
    push ebp
    mov ebp, esp

    cld
    mov ecx, 0FFFFFFFFh
    mov eax, ecx
    mov edi, [ebp + 8]
    repne scasb
    jnz quit
    sub eax, ecx

    quit:
    pop ebp
    ret 4
Str_length endp

main proc uses eax ebx ecx
    push offset source
	call Str_length

	push 0
	call ExitProcess
main endp
end main

