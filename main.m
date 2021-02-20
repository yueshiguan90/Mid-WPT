function main
fun = @objectf;%The objective function has been expressed as a sub-function

%Constraints in matrix form (cl <= nlcon(x) <= cu)
nlcon = @nlc;%The constraints have been expressed in the form of sub-functions
cl = 150;
cu = 150;

%Variable boundaries (lb <= x <= ub)
lb = [0 0 0 0 0 0 0 0 0];
ub = [Inf Inf Inf Inf Inf Inf Inf Inf Inf];         

%Guess the initial value
x0 = [16 16 16 16 16 16 16 16 16]';

%Set solver options
opts = optiset('display','iter');
xtype='CCCCCCCCC';%Set the solution variables to the real number field

%Create a solution object
Opt = opti('fun',fun,'nl',nlcon,cl,cu,'bounds',lb,ub,'x0',x0,'xtype',xtype,'options',opts);

%Solve
[x,fval,exitflag,info] = solve(Opt);
x
fval
exitflag
info
end

function f=objectf(d)%Objective function
M1=dis2m(d(1));%Convert distance to mutual inductance
M2=dis2m(d(2));
M3=dis2m(d(3));
M4=dis2m(d(4));
M5=dis2m(d(5));
M6=dis2m(d(6));
M7=dis2m(d(7));
M8=dis2m(d(8));
M9=dis2m(d(9));

%Reciprocal efficiency
f=((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)^2/50 + ((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))^2/50 + ((((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4)/M3 + (M4*((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5))/M3)^2/50 + (((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)^2/50 + ((((((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4)/M3 + (M4*((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5))/M3)/M2 + (M3*(((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4))/M2)/M1 + (M2*((((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4)/M3 + (M4*((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5))/M3))/M1)^2/50 + 2601/(50*M9^2) + (((((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4)/M3 + (M4*((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5))/M3)/M2 + (M3*(((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4))/M2)^2/50 + (M9/M8 + 51/(M8*M9))^2/50 + (((((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6)/M5 + (M6*((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9)))/M5)/M4 + (M5*(((M9/M8 + 51/(M8*M9))/M7 + (51*M8)/(M7*M9))/M6 + (M7*(M9/M8 + 51/(M8*M9)))/M6))/M4)^2/50 + 51/50
 
end

function con=nlc(d)%Restrictions
con=d(1)+d(2)+d(3)+d(4)+d(5)+d(6)+d(7)+d(8)+d(9);%Total distance constraint
end
