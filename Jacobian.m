function [j] = jacobianfunc

syms theta1 theta2 d3 theta4 theta5  theta6

T01 = DHFUNCTION(0,0,200,theta1); %first transformation matrix from base to joint 1

T12 = DHFUNCTION(70,-pi/2,0,theta2-90); %Transfornation matrix from joint 1 to joint 2

T23 = DHFUNCTION(360,0,d3,0); %Transfornation matrix from joint 2 to joint 3

T34 = DHFUNCTION(0,-pi/2,380,theta4); %Transfornation matrix from joint 3 to joint 4

T45 = DHFUNCTION(0,pi/2,0,theta5); %Transfornation matrix from joint 4 to joint 5

T56 = DHFUNCTION(0,-pi/2,0,theta6); %Transfornation matrix from joint 5 to joint 6

t02 = T01*T12;

t03 = T01*T12*T23;

t04 = T01*T12*T23*T34;

t05 = T01*T12*T23*T34*T45;

t06 = T01*T12*T23*T34*T45*T56;

theta = [theta1 theta2 d3 theta4 theta5  theta6];

xyz = [t06(1,4); t06(2,4); t06(3,4);];

jv =  jacobian(xyz, theta);

ja = [T01(1:3,3) t02(1:3,3) [0;0;0] t04(1:3,3) t05(1:3,3) t06(1:3,3)];

j = [jv; ja];
equ=simplify(det(j))==0
sol=solve(equ,[theta1,theta2, d3, theta4, theta5, theta6])

eval(sol.theta2);
sol.d3;

sol.theta5;

end