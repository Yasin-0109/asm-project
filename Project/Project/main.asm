;
; Project.asm
;
; Created: 27/11/2018 19.25.32
; Author : Yasin Issa Aden, Jaser Ghasemi, Modaser Ghasemi. 
;


; Replace with your application code

.org 0x0000
    jmp main

; DDR* are used just for specifing what will be an input
; pin, and what will be an output pin.
; sbi stands for set bit in i/o register, which means we set 1 bit here.
main:
    sbi DDRB, 7 ;maps over digital pin nr. 13
    sbi DDRB, 6 ;maps over digital pin nr. 12
	sbi DDRB, 5 ;maps over digital pin nr. 11
	sbi DDRB, 4 ;maps over digital pin nr. 10

    sbi DDRE, 3 ;maps over digital pin nr. 5
	sbi DDRG, 5 ;maps over digital pin nr. 4
	sbi DDRE, 5 ;maps over digital pin nr. 3
    
   

    cbi DDRE, 4  ; maps over digital ping nr 2
    ; just set register r20 to 0
    clr r20

; loops polling the pin information to see when either
; there's voltage (bit set - check_press_loop) on digital pin 2,
; or not (bit clear - check_release_loop)
check_press_loop:
    ; if input on pin 2, skip next instruction
    sbis PINE, 4
    rjmp check_press_loop  ; this is the one we will skip
    rjmp toggle_leds
check_release_loop:
    ; if input on pin 2, loop once more
    ; if clear pin 2, switch to button press check loop
    sbic PINE, 4
    rjmp check_release_loop
    rjmp check_press_loop

toggle_leds:
    tst r20
    brne off_pins

	sbis PORTB, 7
    rjmp set_pin_13 ; if pin 13 is not on, set it

    sbis PORTB, 6
    rjmp set_pin_12 ; if pin 12 is not on, set it

	sbis PORTB, 5
    rjmp set_pin_11 ; if pin 11 is not on, set it

    sbis PORTB, 4
    rjmp set_pin_10 ; if pin 10 is not on, set it

    sbis PORTE, 3
    rjmp set_pin_5 ; if pin 5 is not on, set it

	sbis PORTG, 5
    rjmp set_pin_4 ; if pin 4 is not on, set it

	sbis PORTE, 5
    rjmp set_pin_3 ; if pin 3 is not on, set it

all_on:
    ; once it falls through and we set 1 to r20 the first check
    ; in toggle_leads should make sense
    ldi r20, 1
    rjmp check_release_loop

off_pins:
    sbic PORTE, 5
    rjmp off_pin_3

	sbic PORTG, 5
    rjmp off_pin_4

    sbic PORTE, 3
    rjmp off_pin_5

    sbic PORTB, 4
    rjmp off_pin_10

	sbic PORTB, 5
    rjmp off_pin_11

    sbic PORTB, 6
    rjmp off_pin_12

	sbic PORTB, 7
    rjmp off_pin_13 

all_off:
    ; now we go back to our initial state and the whole program loops
    ldi r20, 0
    rjmp check_release_loop

; We use PORT* to write to a pin configured as output (in our main)
; As with DDR*:
set_pin_13:
    sbi PORTB, 7
    rjmp check_release_loop
off_pin_13:
    cbi PORTB, 7
    rjmp all_off

set_pin_12:
    sbi PORTB, 6
    rjmp check_release_loop
off_pin_12:
    cbi PORTB, 6
    rjmp check_release_loop

set_pin_11:
    sbi PORTB, 5
    rjmp check_release_loop
off_pin_11:
    cbi PORTB, 5
    rjmp check_release_loop

set_pin_10:
    sbi PORTB, 4
    rjmp check_release_loop
off_pin_10:
    cbi PORTB, 4
    rjmp check_release_loop

set_pin_5:
    sbi PORTE, 3
    rjmp check_release_loop
off_pin_5:
    cbi PORTE, 3
    rjmp check_release_loop

set_pin_4:
    sbi PORTG, 5
    rjmp check_release_loop
off_pin_4:
    cbi PORTG, 5
    rjmp check_release_loop

set_pin_3:
    sbi PORTE, 5
    rjmp all_on
off_pin_3:
    cbi PORTE, 5
    rjmp check_release_loop

loop:
  rjmp loop