clear all;
close all;
clc;
%% part A , B , C
I = imread('circuit.tif');
[O1 thresh_sobel] = edge(I,'sobel');
[O2 thresh_prewitt] = edge(I,'prewitt');
[O3 thresh_robert] = edge(I,'roberts');
[O4 thresh_canyy] = edge(I,'canny');
[O5 thresh_LOG] = edge(I,'log');
subplot(2,3,1);imshow(I);title('orginal image');
subplot(2,3,2);imshow(O1);title('sobel operator');
subplot(2,3,3);imshow(O2);title('prewitt operator');
subplot(2,3,4);imshow(O3);title('roberts operator');
subplot(2,3,5);imshow(O4);title('canny operator');
subplot(2,3,6);imshow(O5);title('log operator');
thresh_sobel
thresh_prewitt
thresh_robert
thresh_canyy
thresh_LOG

%% part D - Add noise
j1 = imnoise(I,'gaussian',0,0.005);
j2 = imnoise(I,'salt & pepper',0.01);
[O1 thresh_sobel] = edge(j1,'sobel');
[O2 thresh_prewitt] = edge(j1,'prewitt');
[O3 thresh_robert] = edge(j1,'roberts');
[O4 thresh_canyy] = edge(j1,'canny');
[O5 thresh_LOG] = edge(j1,'log');
figure;
subplot(2,3,1);imshow(j1);title('Noisy image');
subplot(2,3,2);imshow(O1);title('sobel operator');
subplot(2,3,3);imshow(O2);title('prewitt operator');
subplot(2,3,4);imshow(O3);title('roberts operator');
subplot(2,3,5);imshow(O4);title('canny operator');
subplot(2,3,6);imshow(O5);title('log operator');
thresh_sobel
thresh_prewitt
thresh_robert
thresh_canyy
thresh_LOG

[O1 thresh_sobel] = edge(j2,'sobel');
[O2 thresh_prewitt] = edge(j2,'prewitt');
[O3 thresh_robert] = edge(j2,'roberts');
[O4 thresh_canyy] = edge(j2,'canny');
[O5 thresh_LOG] = edge(j2,'log');
figure;
subplot(2,3,1);imshow(j2);title('Noisy image');
subplot(2,3,2);imshow(O1);title('sobel operator');
subplot(2,3,3);imshow(O2);title('prewitt operator');
subplot(2,3,4);imshow(O3);title('roberts operator');
subplot(2,3,5);imshow(O4);title('canny operator');
subplot(2,3,6);imshow(O5);title('log operator');
thresh_sobel
thresh_prewitt
thresh_robert
thresh_canyy
thresh_LOG
