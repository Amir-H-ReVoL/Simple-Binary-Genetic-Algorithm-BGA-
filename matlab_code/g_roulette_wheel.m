function[mating_pool]=g_roulette_wheel(pop,n,selection_probability)
cdf(1)=selection_probability(1);
for i=2:n
    cdf(i)=cdf(i-1)+selection_probability(i);
end
for i=1:n
    q=rand;
    for j=1:n
        if q<cdf(j)
            mating_pool(i,:)=pop(j,:);
            break;
        end
    end
end
return;