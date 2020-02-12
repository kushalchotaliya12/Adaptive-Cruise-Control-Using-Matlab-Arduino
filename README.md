# Adaptive-Cruise-Control-Using-Matlab-Arduino

The system is designed with an arduino controller which is connected to LCD and Ultrasonic sensor using a bread board. Distance between two vehicles are sensed by the Ultrasonic Distance Sensor and the respective speed is show in 16x2 LCD Display. The Arduino is a microcontroller which is programmed using MATLAB.

## PROJECT REQUIREMENTS
### HARDWARE REQUIREMENTS
  - Arduino Board
  - Ultrasonic Sensor
  - LCD 16x2
  - Buttons
  - Resistors
### SOFTWARE REQUIREMENTS
  - MATLAB

## CIRCUIT DESIGN
![alt text](https://github.com/kushalchotaliya12/Adaptive-Cruise-Control-Using-Matlab-Arduino/blob/master/Circuit_Design.jpeg)

## ALGORITHM

Step 1: Define the variables required for the program.<br/>
Step 2: Initialize value to the variable like counter=0, input = 0; cruise Control = 0; adaptiveCC = 0; CCspeed = 0;ACCspeed =  0;
Step 3: Set up a Continuous Loop until program is cancelled
Step 4: Set up a Continuous inner Loop until button is presses and input variable is set
Step 5: Read the inputs provided by the operator
Step 6: If the increase speed button is pressed then initialize input=1 and go to step12 by breaking from the loop
Step 7: If the decrease speed button is pressed then initialize input=2 and go to step 13 by breaking from the loop
Step 8: If the Cruise Control button is pressed then cruise Control = 1 and CCspeed=Counter go to step 14 by breaking from the loop
Step 9: If the Adaptive Cruise Control button is pressed then initialize adaptiveCC = 1 and ACCspeed = counter go to step14 by breaking from the loop
Step 10: If the cancel button is pressed then initialize cruise Control = 0, adaptiveCC = 0, ACCspeed = 0 CCspeed = 0; go to step by breaking from the loop
Step 11: Switch for the input provided
Step 12: If input=1 then counter=counter+1 and go to step 17
Step 13: If input=2 Then check if counter is greater than zero, if yes then counter=counter-1 and go to step 17
Step 14: Otherwise check whether counter > 0 && cruiseControl == 0 && adaptiveCC == 0 to know whether cruise control or adaptive cruise control mode are set if above condition is true go to step 15 otherwise step 16
Step 15: counter = counter – 1 and go to step 17
Step 16: If adaptive cruise control is equal to 1 then read the sensor value from ultrasonic pin.and then check whether sensor Value < 0.5 and counter > 0 then decrease counter value by one otherwise if counter < ACC speed then increase counter value by 1
Step 17:print counter
