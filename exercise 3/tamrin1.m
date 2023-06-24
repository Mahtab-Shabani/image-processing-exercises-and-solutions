clear all;
close all;
clc;
%%
I=imread('EGG1.GIF');
B=[0 1 0;
   1 1 1;
   0 1 0];
I2 = imdilate(I,B);
%% show result
subplot(1,2,1);
imshow(uint8(I));
title('Orginal image');
subplot(1,2,2);
imshow(I2);
title('after Filter');
