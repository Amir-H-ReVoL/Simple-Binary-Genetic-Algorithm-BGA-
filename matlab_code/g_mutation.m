function[pop]=g_mutation(new_pop,pm,n,l)
mask = rand(n,l) <= pm;
pop = xor(new_pop,mask);
return;