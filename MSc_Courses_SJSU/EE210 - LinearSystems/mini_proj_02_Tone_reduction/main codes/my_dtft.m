function [X, OM] = my_dtft(x)

cnt=1;

for my_OM = 0:0.0001:pi;
    my_x =0;
    
    for n = 1:length(x);
       my_x = my_x + x(n)*exp(-j*my_OM*n); 
    end
    
    X(cnt) = my_x;
    OM(cnt) = my_OM;
    cnt = cnt+1;
end

end
