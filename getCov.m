function c = getCov(data,mu)
 var = zeros(2,2);
 for count = 1:size(data(:,1),1)
     test = [data(count,1); data(count,2)];
     var = var + (test - mu)*(test - mu)';
 end
 
 c = (1/size(data,1))* var;
 end
