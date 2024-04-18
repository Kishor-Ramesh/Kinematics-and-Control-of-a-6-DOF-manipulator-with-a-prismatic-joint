
function T = DHFUNCTION(ai,alphai,di,thetai) 
  


T = [cos(thetai), -1*sin(thetai), 0, ai ; 
     sin(thetai)*round(cos(alphai)), cos(thetai)*round(cos(alphai)), -1*round(sin(alphai)), -1*di*round(sin(alphai)); 
     sin(thetai)*round(sin(alphai)), cos(thetai)*round(sin(alphai)), round(cos(alphai)), di*round(cos(alphai)); 
     0,                   0,                    0,                  1]; 
end
