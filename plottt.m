clear all

load('Rhoda32_3.mat')

%%
myvars = string(who);

count = 1;
datlen = length(myvars)/2;

trr = zeros(datlen,length(eval(myvars(1))));
time = 1:length(eval(myvars(1)));
time = time *30/1000;

num = 500;
corrtime = (1:num+1)*30/1000;


for i = 1: datlen
    trr(i,:) = eval(myvars(count+datlen))./eval(myvars(count));
    clear((myvars(count)))
    
    attr(i,:) = autocorr(trr(i,:),'NumLags',num);
    count = count +1;
    
end

%%
f = figure(1);
g = figure(2);
count = 1;
for i = 1 : datlen*5

 fff = waitforbuttonpress;
 value = double(get(gcf,'CurrentCharacter'));
        % 28 leftarrow
        % 29 rightarrow


if value  == 29
    plot(time,trr(count,:))
     legend(num2str(count))
    
   
    figure(1)
    plot(corrtime, attr(count,:))
    legend(num2str(count))
    figure(2)
    count = count+1;
    
elseif  value ==28
    plot(time,trr(count-2,:))
     legend(num2str(count-2))
     
     figure(1)
    plot(corrtime,attr(count,:))
    legend(num2str(count-2))
    figure(2)
    count = count -1;
end

end





