%Inverse kinematics using algebraic method 

%user input values


Px = input ('PLEASE ENTER THE GOAL POSTION X = ');
Py = input ('PLEASE ENTER THE GOAL POSTION y = ');
Pz = input ('PLEASE ENTER THE GOAL POSTION z = ');

 
%solution for theta2
rho = sqrt(a2^2 + d4^2);
phi = atan2(a2,d4);

s= (Pz-d1)/rho;

q=(1-s^2);

if q<0

    disp('Out of bounds ')
else

c= sqrt(q); %cos has 2 values
theta2= phi-atan2(s,c);

theta22= phi-atan2(s,-c);
theta2 = theta2*180/pi;

theta22 = theta22*180/pi;

solution1 = [theta2, theta22];

fprintf ('Theta2 - \n');

disp(solution1);

% slider solution

K1 = a1 + d4*cos(theta2) + a2*sin(theta2);

K2 = a1 + d4*cos(theta22) + a2*sin(theta22);

a=Px^2 + Py^2;

d3 = sqrt(abs(a - K1^2));
d31 = sqrt(abs(a - K2^2));

d33 = - sqrt(abs(a - K1^2));

d331 = - sqrt(abs(a - K2^2));


slider_solution = [d3, d31, d33, d331];

fprintf('d3 -\n');

disp(slider_solution)


% solution for theta1 - 1
phi1 = atan2(K1,d3);

phi2 = atan2(K2,d3);
s2 = Px/sqrt(K1^2 + d3^2);

s21 = Px / sqrt(K2^2 + d3^2);

n1= 1 - s2^2;

n2= 1 - s21^2;

if (n1>=0)
    if (n2>=0)

        c2 = sqrt(n1);
        c21 = sqrt(n2);

        theta1 = phi1 - atan2(s2,c2);
        theta12 = phi1 - atan2(s21, c21);
        theta13 = phi2 - atan2(s2,c2);

        theta14 = phi2 - atan2(s21, c21);

        Theta1=theta1*180/pi;
        Theta12=theta12*180/pi;
        Theta13=theta13*180/pi;
        Theta14=theta14*180/pi;
        solution2_1 = [Theta1, Theta12];
        solution2_2 = [Theta13, Theta14];

        fprintf('Theta 1 - \n');
        disp(real(solution2_1));
        disp(real(solution2_2));
    end
else

        disp('Out of bounds')

 
end
end