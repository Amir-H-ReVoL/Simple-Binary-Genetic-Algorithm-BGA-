function [new_pop] = crossover(mating_pool,Pc,n,m)
parent_num = randperm(n);
for i=1:2:n
    pointer1 = parent_num(i);
    pointer2 = parent_num(i+1);
    cut1=randi([1 m-1]);
    cut2=randi([cut1+1 m]);
    
    off1 = mating_pool(pointer1,:);
    off2 = mating_pool(pointer2,:);
    
    if(rand < Pc)
        %%cutoff = randi(size(OffSpring1,2),1,1);

        tmp = off1(cut1:cut2);
        off1(cut1:cut2) = off2(cut1:cut2);
        off2(cut1:cut2) = tmp;
    end
    new_pop(i,:) = off1;
    new_pop(i+1,:) = off2;
end
end
