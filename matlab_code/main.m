clc ;
clear all;
runs = 50;
iter = 100;
m=2;
avgBestSoFar = zeros(runs,iter);
avgAverageFitness = zeros(runs,iter);
avgFinalSol = zeros(runs,m);

for a=1 : runs
    MyGenetic;  
end

avgAverageFitness2 = mean(avgAverageFitness);
avgBestSoFar2 = mean(avgBestSoFar);
t = mean(avgFinalSol);
%%%%% below block just for last run
%{
x=1:iter;
figure,plot(x,best_so_far,'k',x,average_fitness,'.-k');
xlabel('Generation');
ylabel('Fitness Function')
legend('best-so-far','average fitness')
%}

% average of all runs

disp('final solution     optimum fitness');
resultAll = [t,avgBestSoFar2(end)]
x=1:iter;
figure,plot(x,avgBestSoFar2,'k',x,avgAverageFitness2,'.-k');
xlabel('Generation');
ylabel('Fitness Function')
legend('Average Best So Far','Average Mean Fitness')