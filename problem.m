t=0.01:0.01:0.2;    %t is time. It increases by 0.01 sec from 0.01 sec to 0.2 sec.
freq=11:30; %freq increases by 1 from 11 to 30.

for i=1:20  
    a(1:20,i)=cos(2*pi*freq(i)*t);  %It stores the input signal entering the body by dividing the rows of the array by seconds.
end 

load('output.mat')  %Get the output from output.mat into matlab
x=slv(a,output);    %After passing the input a and the output output to the slv function, the value is stored in x.
xx=inv(a)*output;   %When a*xx=output, multiplying both sides by the inverse function of a gives xx=a.

x
disp(x);    %Outputs the x absorbed by the human body.

out1=a*x;   %Store the multiplied value by x in out1.
out2=a*xx;  %Store the multiplied value by xx in out2.

plot(t,out1);   %Express out1 with t as the horizontal axis on a two-dimensional plane.

for id=1:20
    if(x(id)==xx(id))   
        disp("same.");
    else    
        disp("different.");
    end
end
