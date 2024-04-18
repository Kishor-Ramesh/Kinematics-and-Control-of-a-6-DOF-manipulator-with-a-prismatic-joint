
%Forward Kinermatics for 6Dof manipulator
syms  theta1 theta2 d3 theta4 theta5 theta6 %Declaring the variabls:theta1 theta2 theta3 theta4 theta5 theta6

%Enter the joint angles
theta1 = input ('PLEASE ENTER THE VALUE OF THETA1 IN DEGREE = '); 
theta2 = input ('PLEASE ENTER THE VALUE OF THETA2 IN DEGREE = '); 
d3 = input ('PLEASE ENTER THE VALUE OF D = '); 
theta4 = input ('PLEASE ENTER THE VALUE OF THETA4 IN DEGREE = '); 
theta5 = input ('PLEASE ENTER THE VALUE OF THETA5 IN DEGREE = '); 
theta6 = input ('PLEASE ENTER THE VALUE OF THETA6 IN DEGREE = '); 
% 
% theta1 = theta1 * pi/180;
% theta2 = theta2 * pi/180;
% 
% theta4 = theta4 * pi/180;
% theta5 = theta5 * pi/180;
% theta6 = theta6 * pi/180;

T01 = DHFUNCTION(0,0,200,theta1); %first transformation matrix from base to joint 1
T12 = DHFUNCTION(70,-pi/2,0,theta2-(pi/2)); %Transfornation matrix from joint 1 to joint 2
T23 = DHFUNCTION(360,0,d3,0); %Transfornation matrix from joint 2 to joint 3
T34 = DHFUNCTION(0,-pi/2,380,theta4); %Transfornation matrix from joint 3 to joint 4
T45 = DHFUNCTION(0,pi/2,0,theta5); %Transfornation matrix from joint 4 to joint 5
T56 = DHFUNCTION(0,-pi/2,0,theta6); %Transfornation matrix from joint 5 to joint 6

%Tranformation matrix from base to joint 6
T06 = T01 * T12 * T23 * T34 * T45 * T56;

%Calculating the last frame position from the base frame, using Transformation matrix T06
P6x = T06(1,4)
P6y = T06(2,4)
P6z = T06(3,4)

P6 = [P6x;P6y;P6z]



%To calculate Ptip

Ptip = T06 * [0;0;77;1];

