fname = 'series2.tif';
info = imfinfo(fname);
num_images = numel(info);

A = zeros(512,512,num_images);

for k = 1:num_images
    A(:,:,k) = imread(fname, k);
    % ... Do something with image A ...
end

%%
mip = max(A,[],3);

imshow(mip,[])

cont = 1;
nmarks=10;
loop = 0;

while cont ==1

    'adjust'
    
    cont = input('continue ??? 1/0.....')
if cont == 0 
    break
end
    
    for i  = 1: nmarks
    
[m,n] = ginput(1);
   h1 = text(m,n,'+', ...
                'HorizontalAlignment','center', ...
                'Color', [1 0 1], ...
                'FontSize',8);
            
            point(i+loop,1) = round(m);
            point(i+loop,2) = round(n);
end

loop = loop+nmarks;

end

%point

%%
tr = zeros(length(point),num_images);

point = floor(point);

for i = 1: length(point)
    for j = 1:num_images
        
        %tr(i,j) = (A(point(i,1),point(i,2),j));
    
     tr(i,j) = (A(point(i,1),point(i,2),j)+ A(point(i,1)+1,point(i,2),j)...
         +A(point(i,1),point(i,2)+1,j)+A(point(i,1)-1,point(i,2),j)...
         +A(point(i,1),point(i,2)-1,j)+A(point(i,1)+1,point(i,2)+1,j)...
         +A(point(i,1)-1,point(i,2)-1,j)+A(point(i,1)+1,point(i,2)-1,j)...
         +A(point(i,1)-1,point(i,2)+1,j)/9);
   
    
    end
end


flip  = waitforbuttonpress;
count = 1;

for i = 1 : length(point)
    flip  = waitforbuttonpress;
if flip  == 0
    plot(tr(count,:))
    legend(num2str(count))
    count = count +1;
else
    plot(tr(count-1,:))
    legend(num2str(count))
    count = count - 1;
    
end



%flip = input('1 or 0...')
end