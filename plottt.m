clear all


warning('off', 'curvefit:fit:invalidStartPoint' );

load('10.mat')

%%
myvars = string(who);

count = 1;
datlen = length(myvars)/2;

trr = zeros(datlen,length(eval(myvars(1))));
time = 1:length(eval(myvars(1)));
time = time *30/1000;

num = 500;
corrtime = (1:num+1)*30/1000;
trant = transpose(corrtime);

fitco = zeros(datlen,2);

for i = 1: datlen
    trr(i,:) = eval(myvars(count+datlen))./eval(myvars(count));
    clear((myvars(count)))
    
    attr(i,:) = autocorr(trr(i,:),'NumLags',num);
    
    trana = transpose(attr(i,:));
    
    lup = fit(trant,trana,'Exp1');
    
    ccc = coeffvalues(lup);
    fitco(i,1) = ccc(1);
    fitco(i,2) = ccc(2);
    
     count = count +1;
end

%%
%f = figure(1);
%g = figure(2);
count = 1;
for i = 1 : datlen*5

 fff = waitforbuttonpress;
 value = double(get(gcf,'CurrentCharacter'));
        % 28 leftarrow
        % 29 rightarrow


if value  == 29
    subplot(2,1,1), plot(time,trr(count,:))
     legend(num2str(count))
    
   
    %figure(1)
    subplot(2,1,2), plot(corrtime, attr(count,:))
    legend(num2str(count))
    %figure(2)
    count = count+1;
    
elseif  value ==28
    subplot(2,1,1), plot(time,trr(count-2,:))
     legend(num2str(count-2))
     
     %figure(1)
    subplot(2,1,2), plot(corrtime,attr(count,:))
    legend(num2str(count-2))
    %figure(2)
    count = count -1;
end

end


