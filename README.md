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

## BUTTONS
In this project we used buttons to demonstrate the project.

<b>Increase_speed</b> : To increase the speed.

<b>Decrease_speed</b> : To decrease the speed

<b>Set_speed / cruise_control</b> : This button is used in the system to enable the cruise control mode. Increase_speed and Decrease_speed buttons can be used during this mode.

<b>Adaptive_speed/ Adaptive_ cruise_control</b> : This button will enable the adaptive cruise control mode which is used to automatically sense the distance of the vehicle moving ahead and increase or decrease the speed of the vehicle with the respective distance. Increase_speed and Decrease_speed will be dysfunctional and pressing the cancel button will disable the cruise control. Display should continuously blink while adjusting the speed.

<b>Cancel</b> : Pressing the button, cancels the Cruise control and resets the speed to 0.

## ALGORITHM

Step 1: Define the variables required for the program.<br/>

Step 2: Initialize value to the variable like counter=0, input = 0; cruise Control = 0; adaptiveCC = 0; CCspeed = 0;ACCspeed =  0;<br/>

Step 3: Set up a Continuous Loop until program is cancelled<br/>

Step 4: Set up a Continuous inner Loop until button is presses and input variable is set<br/>

Step 5: Read the inputs provided by the operator<br/>

Step 6: If the increase speed button is pressed then initialize input=1 and go to step12 by breaking from the loop<br/>

Step 7: If the decrease speed button is pressed then initialize input=2 and go to step 13 by breaking from the loop<br/>

Step 8: If the Cruise Control button is pressed then cruise Control = 1 and CCspeed=Counter go to step 14 by breaking from the loop<br/>

Step 9: If the Adaptive Cruise Control button is pressed then initialize adaptiveCC = 1 and ACCspeed = counter go to step14 by breaking from the loop<br/>

Step 10: If the cancel button is pressed then initialize cruise Control = 0, adaptiveCC = 0, ACCspeed = 0 CCspeed = 0; go to step by breaking from the loop<br/>

Step 11: Switch for the input provided<br/>

Step 12: If input=1 then counter=counter+1 and go to step 17<br/>

Step 13: If input=2 Then check if counter is greater than zero, if yes then counter=counter-1 and go to step 17<br/>

Step 14: Otherwise check whether counter > 0 && cruiseControl == 0 && adaptiveCC == 0 to know whether cruise control or adaptive cruise control mode are set if above condition is true go to step 15 otherwise step 16<br/>

Step 15: counter = counter – 1 and go to step 17<br/>

Step 16: If adaptive cruise control is equal to 1 then read the sensor value from ultrasonic pin.and then check whether sensor Value < 0.5 and counter > 0 then decrease counter value by one otherwise if counter < ACC speed then increase counter value by 1<br/>

Step 17:print counter<br/>
