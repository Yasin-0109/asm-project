# A Project for the AVR - Written in Assembler Language

The purpose of this assignment is to write a small software project in assembler code. The MCU to be used is the AVR ATmega2560, and the project should include some form of interaction with sensors and actuators.

## Description of the Project

You are going to design and implement an application on the AVR atmega2560 microcontroller. This could be a game, a "smart-home" device, some sort of controller of electrical equipment. Your imagination and time are the only limits.

The following are some non-functional requirements for the project:
* The application must be written in AVR assembler
* Your project must include some form of user interface (using sensors and actuators from the Arduino starter kit)


### Learning goals (from the course description):
* Create functioning assembler programs for microcontrollers
* Analyse ASM programs (AVR MCU) and calculate execution time
* Execute and debug assembler programs
* Create applications using assembler programming
* Integrate simple I/O devices in embedded applications


## Deliveries

### Problem Formulation

How can led light switch be build using the ARV ATmega2560, and can this light be given other useful functionalities?
Questions to be answered:
-	How will the sensors and actuators be implemented? 
-	How does a light switch work?
-	How can you toggle multiple leds?
-	Which fields rely on similar technologies.?
-	How should the code be written in assembler?

## Analyses

Astah diagrams can be found in uploaded in the respitory

### Test plan

When starting the program all leds are off. When the button is pressed the first led will light up, and if it is pressed again the second will light op after and so on until all leds are on. When all the leds are on it will reverse. Once button is pressed now the last led will be turned of and then the second last an so on until all leds are of. 
 


