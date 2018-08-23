; test lodsX and stosX instruction, X could be ('b', 'w', 'd')
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
Count = 20
source dword Count dup(4)
dest   dword lengthof source dup(?)

.code
;   three params
;       push size
;       push offset dst
;       push offset src
storeArray proc
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]      ; source offset
    mov edi, [ebp + 12]     ; dest offset
    mov ecx, [ebp + 16]     ; array size
    cld
    
    copyBeg:
        lodsd   ; load esi to eax
        stosd   ; store eax to edi
    loop copyBeg

    pop ebp
    ret 12
storeArray endp

main proc uses eax ebx ecx
	push lengthof source
    push offset dest
    push offset source
	call storeArray

	push 0
	call ExitProcess
main endp
end main

