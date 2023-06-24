clear;
close all;
clc
%% A
i=imread('pool.png');
r=i(:,:,1);
g=i(:,:,2);
b=i(:,:,3);

% figure;
% imshow(i);
% title('orginal');
% irgb= rgb2gray(i);
% figure;
% imhist(irgb);

figure;
subplot(2,3,1)
imshow(r);
title('Red');
subplot(2,3,2)
imshow(g);
title('Green');
subplot(2,3,3)
imshow(b);
title('Blue');
subplot(2,3,4), imhist(r), title('hist of red');
subplot(2,3,5), imhist(g), title('hist of green');
subplot(2,3,6), imhist(b), title('hist of blue');

%% B

[x,map]=rgb2ind(i,[]);
% [size dim]=size(map);

mapred=map;
mapred(:,1)=0;
figure
imshow(x,mapred);
title('pic without R');

mapgreen=map;
mapgreen(:,2)=0;
figure
imshow(x,mapgreen);
title('pic without G');

mapblue=map;
mapblue(:,3)=0;
figure
imshow(x,mapblue);
title('pic without B');
