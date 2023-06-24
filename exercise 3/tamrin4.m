close all;
clear all;
clc;
%%
I = imread('ART2.GIF');
I=immultiply(I,20);

e45=[1  1  0
     1  0 -1
     0 -1 -1 ];

e45minus=[ 0  1  1
          -1  0 -1
          -1 -1  0 ];

e90= [1  0 -1
     1  0 -1
     1  0 -1];

e0=[1  1  1
     0  0  0
    -1 -1 -1 ];

f0   = imfilter(I,e0,'symmetric','full');
f90  = imfilter(I,e90,'symmetric','full');
f45  = imfilter(I,e45,'symmetric','full');
f45m = imfilter(I,e45minus,'symmetric','full');

subplot(2,3,1);imshow(I);title('Orgianl Image');
subplot(2,3,2);imshow(f0);title('Vertical / 0 degree');
subplot(2,3,3);imshow(f90);title('Horizontal / 90 degree');
subplot(2,3,5);imshow(f45);title('45 degree');
subplot(2,3,6);imshow(f45m);title('-45 degree');
