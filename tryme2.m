c=1;



fig1 = figure;
imshow(mip,[])
datacursormode on
while c==1
dcm_obj = datacursormode(fig1);
disp('click on the datapoint')
rubbish = input('...');

jindex = 1;

c_info = getCursorInfo(dcm_obj);
    yum = c_info.Position;

point(jindex,1) = yum(1);
point(jindex,2) = yum(2);


%%
tr = zeros(1,num_images);

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

fig2 = figure
plot(tr)
drawnow
end