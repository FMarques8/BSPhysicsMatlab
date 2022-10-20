%pc gustavo até 1000

f1 = 'bubble_sort.csv'; 
f2 = 'heap_sort.csv';
f3 = 'insertion_sort.csv';
f4 = 'merge_sort.csv';
f5 = 'quick_sort.csv';
f6 = 'rank_sort.csv';
f7 = 'selection_sort.csv';
f8 = 'shaker_sort.csv';
f9 = 'shell_sort.csv';
f10 = 'comb_sort.csv';

bubble = readmatrix(f1);
heap = readmatrix(f2);
insertion = readmatrix(f3);
merge = readmatrix(f4);
quick = readmatrix(f5);
rank = readmatrix(f6);
selection = readmatrix(f7);
shaker = readmatrix(f8);
shell = readmatrix(f9);
comb = readmatrix(f10);

x = [1:1:1000];

%time (secs)

bubbleb = bubble(:,3); 
bubblew = bubble(:,2); 

heapb = heap(:,3);
heapw = heap(:,2); 

insertionb = insertion(:,3); 
insertionw = insertion(:,2);

mergeb = merge(:,3);
mergew = merge(:,2); 

quickb = quick(:,3); 
quickw = quick(:,2);

rankb = rank(:,3);
rankw = rank(:,2); 

selectionb = selection(:,3);
selectionw = selection(:,2);

shakerb = shaker(:,3); 
shakerw = shaker(:,2); 

shellb = shell(:,3);
shellw = shell(:,2);

combb = comb(:,3);
combw = comb(:,2);

% semilogy(x,bubbleb,'.r')
% hold on 
% 
% semilogy(x,heapb,'.b')
  
% semilogy(x,insertionb,'.g')
% hold on 
% semilogy(x,mergeb,'.k')
%hold on  
% semilogy(x,quickb,'.c')
%hold on  
% semilogy(x,rankb,'.b')
%hold on  
% semilogy(x,selectionb,'.g')
%hold on  
% semilogy(x,shakerb,'.k')
%hold on  
% semilogy(x,shellb,'.r')
%hold on  
 semilogy(x,combb,'.r')
hold on 

% semilogy(x,bubblew,'.r')
% semilogy(x,heapw,'.b')
% semilogy(x,insertionw,'.g')
% semilogy(x,mergew,'.k')
% semilogy(x,quickw,'.c')
% semilogy(x,selectionw,'.g')
% semilogy(x,shakerw,'.k')
% semilogy(x,rankw,'.b')
% semilogy(x,shellw,'.r')
 semilogy(x,combw,'.r')

grid on
ylim([10^-7 30])

title ('Computador 2; Comb Sort', 'FontSize',14)
xlabel ('N', 'FontSize',10)
ylabel ('Time (secs)', 'FontSize',10)

% legend('Bubble Sort','Heap Sort','Insertion Sort','Merge Sort','Quick Sort','Rank Sort','Selection Sort','Shaker Sort','Shell Sort','Comb Sort')





