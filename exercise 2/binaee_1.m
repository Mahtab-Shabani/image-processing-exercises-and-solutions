clc;
clear;
close all;
%% part A & B
i=imread('pout.tif');
j = imnoise(i,'gaussian',0,0.001);
subplot(1,2,1);
imshow(i);
title('Orginal image');
subplot(1,2,2);
imshow(uint8(j));
title('Noisy image');

%% part C
% a=2;
% w=ones(2*a+1);
% w=w/sum(w(:));
h1 = fspecial('average', 3);
h2 = fspecial('gaussian', 3, 1);
f1=imfilter(j,h1,'symmetric','full');
f2=imfilter(j,h2,'symmetric','full');
figure;
subplot(1,3,1);
imshow(j);
title('Noisy image, 0.001 percent');
subplot(1,3,2);
imshow(f1);
title('after Average Filter');
subplot(1,3,3);
imshow(f2);
title('after gaussian Filter');

j = imnoise(i,'gaussian',0,0.01);
h1 = fspecial('average', 3);
h2 = fspecial('gaussian', 3, 1);
f1=imfilter(j,h1,'symmetric','full');
f2=imfilter(j,h2,'symmetric','full');
figure;
subplot(1,3,1);
imshow(j);
title('Noisy image , 0.01 percent');
subplot(1,3,2);
imshow(f1);
title('after Average Filter');
subplot(1,3,3);
imshow(f2);
title('after gaussian Filter');

%% part next
j = imnoise(i,'salt & pepper',0.1);
figure;
subplot(1,2,1);
imshow(i);
title('Orginal image');
subplot(1,2,2);
imshow(uint8(j));
title('Noisy image');

h1 = fspecial('average', 3);
h2 = fspecial('gaussian', 3, 1);
f1=imfilter(j,h1,'symmetric','full');
f2=imfilter(j,h2,'symmetric','full');
figure;
subplot(1,3,1);
imshow(j);
title('Noisy image');
subplot(1,3,2);
imshow(f1);
title('after Average Filter');
subplot(1,3,3);
imshow(f2);
title('after gaussian Filter');

%% part d
j1 = medfilt2(j , [3 3]);
j2 = medfilt2(j , [5 5]);
figure;
subplot(1,3,1);
imshow(j);
title('Noisy image');
subplot(1,3,2);
imshow(j1);
title('after Median Filter 3X3');
subplot(1,3,3);
imshow(j2);
title('after Median Filter 5X5');

