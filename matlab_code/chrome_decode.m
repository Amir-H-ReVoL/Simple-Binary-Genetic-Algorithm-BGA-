function[real_val]=chrome_decode(pop,n,bs,m,lo,hi)
real_val = [];
STED(1)=1;
for i=2:m+1
    STED(i) = STED(i-1)+bs(i-1);
end
for j=1:m
    x=bs(j)-1:-1:0;
    pow2x = 2.^x;
    for i=1:n
        gene=pop(i,STED(j):STED(j+1)-1);
        var_norm = sum(pow2x.*gene)/(2^bs(j)-1);
        real_val(i,j)=lo(j)+(hi(j)-lo(j))*var_norm;
    end
end
return;
