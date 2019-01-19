function[new_pop]=g_crossover(mating_pool,pc,n,l)
parent_num = randperm(n);
for j=1:2:n
    pointer1 = parent_num(j);
    pointer2 = parent_num(j+1);
    cut_point = randi(1,1,l);
    off1 = mating_pool(pointer1,:);
    off2 = mating_pool(pointer2,:);
    if rand<pc
        temp = off2;
        off2(cut_point+1:end)=off1(cut_point+1:end);
        off1(cut_point+1:end)=temp(cut_point+1:end);
    end
    new_pop(j,:)=off1;
    new_pop(j+1,:)=off2;
end
return;
