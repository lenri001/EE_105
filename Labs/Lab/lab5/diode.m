function [id]=diode(vd)
A = 0.0007;
if vd>0.7
    Rd = 0.01;
    id = A+(vd-0.7)/Rd;
else
    Rd = 1000;
    id = A+(vd*0.7)/Rd;
end

end