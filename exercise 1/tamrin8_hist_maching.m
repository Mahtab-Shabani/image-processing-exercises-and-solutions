clc;
clear;
close all;
%% Load Image
i=imread('lake.tif');
nPixel=numel(i);
%% hist matching one
mu=50;
sigma=30;
H=@(x) exp(-1/(2*sigma^2)*(x-mu).^2);

x=-50:255;

hgram=H(x);
hgram=round(nPixel*hgram/sum(hgram));

i2=histeq(i,hgram);
% Show Results
figure;
subplot(2,2,1); imshow(i); title('Original Image');
subplot(2,2,2); imshow(i2); title('Result of hist maching Guasian');
subplot(2,2,3); imhist(i);
subplot(2,2,4); imhist(i2);

%% hist matching two
H=@(x) sqrt(x);
x=150:255;

hgram=H(x);
hgram=round(nPixel*hgram/sum(hgram));

i2=histeq(i,hgram);
% Show Results
figure;
subplot(2,2,1); imshow(i); title('Original Image');
subplot(2,2,2); imshow(i2); title('Result of hist maching radical x');
subplot(2,2,3); imhist(i);
subplot(2,2,4); imhist(i2);

%% hist matching three
H=@(x) x.^(5);
x=0:255;

hgram=H(x);
hgram=round(nPixel*hgram/sum(hgram));

i2=histeq(i,hgram);
% Show Results
figure;
subplot(2,2,1); imshow(i); title('Original Image');
subplot(2,2,2); imshow(i2); title('Result of hist maching x^5');
subplot(2,2,3); imhist(i);
subplot(2,2,4); imhist(i2);
