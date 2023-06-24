clear all; close all; clc;
%%
I=imread('Baboon.tif');
w4=[0  1 0;
    1 -4 1;
    0  1 0];
w8=[1  1 1;
    1 -8 1;
    1  1 1];
f=im2double(I);
g4 = f - imfilter(f,w4,'replicate');
g8 = f - imfilter(f,w8,'replicate');
figure;
subplot(1,3,1), imshow(I); title('Orginal image');
subplot(1,3,2), imshow(g4);title('Laplacian Filter 4');
subplot(1,3,3), imshow(g8);title('Laplacian Filter 8');
