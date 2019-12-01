%% Arduino Setup
%a = arduino('COM7','uno','Libraries',{'Ultrasonic','ExampleLCD/LCDAddOn', 'JRodrigoTech/HCSR04'},'ForceBuildOn',true);
lcd = addon(a,"ExampleLCD/LCDAddon",'RegisterSelectPin','D7','EnablePin','D6','DataPins',{'D5','D4','D3','D2'});    % LCD Object
initializeLCD(lcd); % Initializing LCD
sensor = addon(a, 'JRodrigoTech/HCSR04','D12','D8');    % Ultra sonic Sensor Object
counter = 0;    % Speed counter
printLCD(lcd, char("Speed: " + counter + " km/h")); % Printing on LCD

%% Button Definitions and Pins attached
% increase_speed :- D13
% decrease_speed - A2
% cruise_control - A1
% Adaptive_cruise_control - D9
% cancel - D11

%% Variable Creation
input = 0;          % checking which is button pressed
cruiseControl = 0;  % Cruise Control ON/OFF
adaptiveCC = 0;     % Adaptive Cruise Control ON/OFF
CCspeed = 0;        % Cruise Control Speed
ACCspeed = 0;       % Adaptive Cruise Control Speed

%% Logic Implementation
while true  % Continuous Loop until program is cancelled
while true  % Continuous Loop until button is presses and input variable is set
    increaseBtn = readDigitalPin(a, 'D13');     % Reading increase Button pin - DIGITAL PIN
    decreaseBtn = readVoltage(a, 'A2');         % Reading decrese Button pin - ANALOG PIN
    cruiseControlBtn = readVoltage(a, 'A1');    % Reading Cruise Control Button pin - ANALOG PIN
    adaptiveCCBtn = readDigitalPin(a, 'D9');    % Reading Adaptive Cruise Control Button pin - DIGITAL PIN
    cancelBtn = readDigitalPin(a, 'D11');       % Reading Cancel Button pin - DIGITAL PIN
    
    if(increaseBtn == 1)            % Increse Button pressed
        input = 1;
        break;
    elseif(decreaseBtn > 4)         % Decrese Button Pressed
        input = 2;
        break;
    elseif(cruiseControlBtn > 4)    % Cruise Control Button Pressed
        cruiseControl = 1;          % Setting cruiseControl
        CCspeed = counter;          % Setting cruiseControl Speed to current Speed
        break;                      
    elseif(adaptiveCCBtn == 1)      % Adaptive Cruise Control Button Pressed
        adaptiveCC = 1;             % Setting Adaptive Cruise Control
        ACCspeed = counter;         % Setting Adaptive Cruise Control to Current Speed(Counter)
        break;
    elseif(cancelBtn == 1)          % Cancel Button Pressed
        cruiseControl = 0;          % Cancel Cruise Control Mode
        adaptiveCC = 0;             % Cancel Adaptive Cruise Control Mode
        ACCspeed = 0;               % Set Adaptive Cruise Control Speed to 0
        CCspeed = 0;                % Set Cruise Control Speed to 0
        break;
    else
        input = 0;                  % If none of the button will be pressed
        break;
    end
end


switch input    % Swtch-Case
    
    case 1                      % if Input will be 1 (Increase Speed)
        counter = counter + 1;  % Increse counter by 1
    case 2                          % if Input will be 2 (Decrease Speed)
        if (counter > 0)            % checking is speed is greater than 0
            counter = counter - 1;  % Decrease counter by 1
        end
    otherwise                                                       % If Input will be 0
        if(counter > 0 && cruiseControl == 0 && adaptiveCC == 0)    % If cruise Control and adaptive cruise control mode are not set
            counter = counter - 1;                                  % Decrease counter by 1
        elseif(adaptiveCC == 1)                                     % If Adaptive Cruise Control mode is ON
            sensorValue = readDistance(sensor);                     % Read Sensor Value
            if(sensorValue < 0.5 && counter > 0)                    % Object is detected in ultrasonic sensor
                counter = counter - 1;                              % Decrease counter by 1
            elseif(counter < ACCspeed)                              % If object is removed in front of ultrasonic sensor
                counter = counter + 1;                              % increse counter by 1
            end
            printLCD(lcd, char(""));                                % Print on LCD
            pause(0.5);                                             % Pause for 0.5 seconds
        end
end
printLCD(lcd, char("Speed: " + counter + " km/h"));                 % Print on LCD
pause(0.5);                                                         % Pause for 0.5 seconds
end