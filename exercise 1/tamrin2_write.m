clear;
close all;
clc;
%%
c=cd;
i=imread('barbara.gif');

j=5;
while j<=55
    imwrite(i,strcat(c,'\',int2str(j),'.jpg'),'quality',j);
    j=j+10;
end
    
j=5;
for k=1:6
    i=imread(strcat(c,'\',int2str(j),'.jpg'));    
    subplot(2,6,k);
    imshow(i);
    title(strcat('q=',int2str(j)));
    subplot(2,6,k+6);
    imhist(i);
    title(strcat('q=',int2str(j)));
    j=j+10;
end
