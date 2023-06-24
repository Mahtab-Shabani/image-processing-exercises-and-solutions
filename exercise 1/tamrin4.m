% clear;
% close all;
% clc

im=imread('pool.png');
%% show pic
j=2;
while j<=122
    for k=1:7
        [b,map]=rgb2ind(im,j);
        subplot(2,4,k);imshow(b,map);title(strcat('number of colors = ',int2str(j)));
        j=j+20;
    end
end
%% show graycale pic
figure;
j=2;
while j<=122
    for k=1:7
        [b,map]=rgb2ind(im,j);
        subplot(2,4,k);imshow(b);title(strcat('number of colors = ',int2str(j)));
        j=j+20;
    end
end
%% show histogram of pic
j=2;
figure;
while j<=122
    for k=1:7
        [b,map]=rgb2ind(im,j);
        subplot(2,4,k); imhist(b)
        title(strcat(' hist of grayscale pic. num.colors=',int2str(j)));
        j=j+20;
    end
end
%% show pic after histogram equalization
figure;
j=2;
while j<=122
    for k=1:7
        [b,map]=rgb2ind(im,j);
        h=histeq(b);        
        subplot(2,4,k);imshow(h);title(strcat('number of colors = ',int2str(j)));
        j=j+20;
    end
end
%% show histogram of pic
j=2;
figure;
while j<=122
    for k=1:7
        [b,map]=rgb2ind(im,j);
        h=histeq(b);        
        subplot(2,4,k); imhist(h);
        title(strcat(' hist of histeq pic. num.colors=',int2str(j)));
        j=j+20;
    end
end
