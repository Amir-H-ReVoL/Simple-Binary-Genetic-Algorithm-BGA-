n=50;
pc=0.9;
pm=0.005;
bs=[10 10];
l=sum(bs);
lo=[-4 -1.5];
hi=[2 1];
pop  =round(rand(n,l));
best_so_far = [];
average_fitness = [];
for i=1 : iter 
    [real_val]=chrome_decode(pop,n,bs,m,lo,hi);
    [selection_probability,fit,ave_fit,max_fit,opt_sol]=fit_eval(real_val,n,m);
    
        if i==1 
            best_so_far(i)=max_fit;
            final_sol = opt_sol;
        elseif max_fit>best_so_far(i-1)
            best_so_far(i) = max_fit;
            final_sol = opt_sol;
        else 
            best_so_far(i)=best_so_far(i-1);
        end
        
        average_fitness(i)=ave_fit;
        avgBestSoFar(a,i) = best_so_far(i);
        avgAverageFitness(a,i) = average_fitness(i);
        for h=1:m
            avgFinalSol(a,h) = final_sol(h);
        end
        
        [mating_pool] = g_roulette_wheel(pop,n,selection_probability);
        [new_pop]=g_crossover(mating_pool,pc,n,l);
        [pop]=g_mutation(new_pop,pm,n,l);
end

disp('');
result = [a,final_sol,best_so_far(end)]
%{
x=1:iter;
figure,plot(x,best_so_far,'k',x,average_fitness,'.-k');
xlabel('Generation');
ylabel('Fitness Function')
legend('best-so-far','average fitness')
%}
            
