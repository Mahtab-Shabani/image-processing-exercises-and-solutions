clc;
clear;
close all;
%% part A & B
i1=imread('cameraman.tif');
i2=imread('barbara.gif');

num1=0; num2=0; num3=0; num4=0; num5=0; num6=0;
num7=0; num8=0; num9=0; num10=0; num11=0; num12=0;
k1=double(i1);
k2=double(i2);
[m1,n1]=size(i1);
[m2,n2]=size(i2);

%% Add Noise
j1 = imnoise(i1,'salt & pepper',0.1);
j2 = imnoise(i2,'salt & pepper',0.1);
g1 = imnoise(i1,'gaussian',0,0.01);
g2 = imnoise(i2,'gaussian',0,0.01);

%% Median Filter
med1 = medfilt2(j1 , [3 3]); med2 = medfilt2(j1 , [5 5]);
med3 = medfilt2(j1 , [7 7]); med4 = medfilt2(j2 , [3 3]);
med5 = medfilt2(j2 , [5 5]); med6 = medfilt2(j2 , [7 7]);
% PSNR
a1=double(med1); a2=double(med2); a3=double(med3);
a4=double(med4); a5=double(med5); a6=double(med6);

for i=1:m1;
    for j=1:n1;
        num1=num1+((abs(k1(i,j)-a1(i,j)))^2);
        num2=num2+((abs(k1(i,j)-a2(i,j)))^2);
        num3=num3+((abs(k1(i,j)-a3(i,j)))^2);
        num4=num4+((abs(k2(i,j)-a4(i,j)))^2);
        num5=num5+((abs(k2(i,j)-a5(i,j)))^2);
        num6=num6+((abs(k2(i,j)-a6(i,j)))^2);
    end
end
MSE1=round(num1/(m1*n1)); MSE2=round(num2/(m1*n1));
MSE3=round(num3/(m1*n1)); MSE4=round(num4/(m2*n2));
MSE5=round(num5/(m2*n2)); MSE6=round(num6/(m2*n2));

PSNR1=round(10*(log10((255^2)/MSE1))); PSNR2=round(10*(log10((255^2)/MSE2)));
PSNR3=round(10*(log10((255^2)/MSE3))); PSNR4=round(10*(log10((255^2)/MSE4)));
PSNR5=round(10*(log10((255^2)/MSE5))); PSNR6=round(10*(log10((255^2)/MSE6)));
% show
figure;
subplot(2,4,1); imshow(j1);   title('Noisy image');
subplot(2,4,2); imshow(med1); title(strcat('after Median Filter 3X3 , PSNR=',num2str(PSNR1)));
subplot(2,4,3); imshow(med2); title(strcat('after Median Filter 5X5 , PSNR=',num2str(PSNR2)));
subplot(2,4,4); imshow(med3); title(strcat('after Median Filter 7X7 , PSNR=',num2str(PSNR3)));
subplot(2,4,5); imshow(j2);   title('Noisy image');
subplot(2,4,6); imshow(med4); title(strcat('after Median Filter 3X3 , PSNR=',num2str(PSNR4)));
subplot(2,4,7); imshow(med5); title(strcat('after Median Filter 5X5 , PSNR=',num2str(PSNR5)));
subplot(2,4,8); imshow(med6); title(strcat('after Median Filter 7X7 , PSNR=',num2str(PSNR6)));
%
med1 = medfilt2(g1 , [3 3]); med2 = medfilt2(g1 , [5 5]);
med3 = medfilt2(g1 , [7 7]); med4 = medfilt2(g2 , [3 3]);
med5 = medfilt2(g2 , [5 5]); med6 = medfilt2(g2 , [7 7]);
% PSNR
a1=double(med1); a2=double(med2); a3=double(med3);
a4=double(med4); a5=double(med5); a6=double(med6);

for i=1:m1;
    for j=1:n1;
        num1=num1+((abs(k1(i,j)-a1(i,j)))^2);
        num2=num2+((abs(k1(i,j)-a2(i,j)))^2);
        num3=num3+((abs(k1(i,j)-a3(i,j)))^2);
        num4=num4+((abs(k2(i,j)-a4(i,j)))^2);
        num5=num5+((abs(k2(i,j)-a5(i,j)))^2);
        num6=num6+((abs(k2(i,j)-a6(i,j)))^2);
    end
end
MSE1=round(num1/(m1*n1)); MSE2=round(num2/(m1*n1));
MSE3=round(num3/(m1*n1)); MSE4=round(num4/(m2*n2));
MSE5=round(num5/(m2*n2)); MSE6=round(num6/(m2*n2));

PSNR1=round(10*(log10((255^2)/MSE1)));
PSNR2=round(10*(log10((255^2)/MSE2)));
PSNR3=round(10*(log10((255^2)/MSE3)));
PSNR4=round(10*(log10((255^2)/MSE4)));
PSNR5=round(10*(log10((255^2)/MSE5)));
PSNR6=round(10*(log10((255^2)/MSE6)));

figure;
subplot(2,4,1); imshow(g1);   title('Noisy image');
subplot(2,4,2); imshow(med1); title(strcat('after Median Filter 3X3 , PSNR=',num2str(PSNR1)));
subplot(2,4,3); imshow(med2); title(strcat('after Median Filter 5X5 , PSNR=',num2str(PSNR2)));
subplot(2,4,4); imshow(med3); title(strcat('after Median Filter 7X7 , PSNR=',num2str(PSNR3)));
subplot(2,4,5); imshow(g2);   title('Noisy image');
subplot(2,4,6); imshow(med4); title(strcat('after Median Filter 3X3 , PSNR=',num2str(PSNR4)));
subplot(2,4,7); imshow(med5); title(strcat('after Median Filter 5X5 , PSNR=',num2str(PSNR5)));
subplot(2,4,8); imshow(med6); title(strcat('after Median Filter 7X7 , PSNR=',num2str(PSNR6)));

%% Averaging Filter
h1 = fspecial('average', 3);
h2 = fspecial('average', 5);
h3 = fspecial('average', 7);

f1=imfilter(j1,h1,'symmetric','full');
f2=imfilter(j1,h2,'symmetric','full');
f3=imfilter(j1,h3,'symmetric','full');
f4=imfilter(j2,h1,'symmetric','full');
f5=imfilter(j2,h2,'symmetric','full');
f6=imfilter(j2,h3,'symmetric','full');
f7=imfilter(g1,h1,'symmetric','full');
f8=imfilter(g1,h2,'symmetric','full');
f9=imfilter(g1,h3,'symmetric','full');
f10=imfilter(g2,h1,'symmetric','full');
f11=imfilter(g2,h2,'symmetric','full');
f12=imfilter(g2,h3,'symmetric','full');

a1=double(f1); a2=double(f2); a3=double(f3); a4=double(f4);
a5=double(f5); a6=double(f6); a7=double(f7); a8=double(f8);
a9=double(f9); a10=double(f10); a11=double(f11); a12=double(f12);
for i=1:m1;
    for j=1:n1;
        num1=num1+((abs(k1(i,j)-a1(i,j)))^2);
        num2=num2+((abs(k1(i,j)-a2(i,j)))^2);
        num3=num3+((abs(k1(i,j)-a3(i,j)))^2);
        num4=num4+((abs(k2(i,j)-a4(i,j)))^2);
        num5=num5+((abs(k2(i,j)-a5(i,j)))^2);
        num6=num6+((abs(k2(i,j)-a6(i,j)))^2);
        num7=num7+((abs(k1(i,j)-a7(i,j)))^2);
        num8=num8+((abs(k1(i,j)-a8(i,j)))^2);
        num9=num9+((abs(k1(i,j)-a9(i,j)))^2);
        num10=num10+((abs(k2(i,j)-a10(i,j)))^2);
        num11=num11+((abs(k2(i,j)-a11(i,j)))^2);
        num12=num12+((abs(k2(i,j)-a12(i,j)))^2);
    end
end
MSE1=round(num1/(m1*n1));
MSE2=round(num2/(m1*n1));
MSE3=round(num3/(m1*n1));
MSE4=round(num4/(m2*n2));
MSE5=round(num5/(m2*n2));
MSE6=round(num6/(m2*n2));
MSE7=round(num7/(m1*n1));
MSE8=round(num8/(m1*n1));
MSE9=round(num9/(m1*n1));
MSE10=round(num10/(m2*n2));
MSE11=round(num11/(m2*n2));
MSE12=round(num12/(m2*n2));
PSNR1=round(10*(log10((255^2)/MSE1)));
PSNR2=round(10*(log10((255^2)/MSE2)));
PSNR3=round(10*(log10((255^2)/MSE3)));
PSNR4=round(10*(log10((255^2)/MSE4)));
PSNR5=round(10*(log10((255^2)/MSE5)));
PSNR6=round(10*(log10((255^2)/MSE6)));
PSNR7=round(10*(log10((255^2)/MSE7)));
PSNR8=round(10*(log10((255^2)/MSE8)));
PSNR9=round(10*(log10((255^2)/MSE9)));
PSNR10=round(10*(log10((255^2)/MSE10)));
PSNR11=round(10*(log10((255^2)/MSE11)));
PSNR12=round(10*(log10((255^2)/MSE12)));
% show
figure;
subplot(2,4,1); imshow(j1); title('Noisy image');
subplot(2,4,2); imshow(f1);
title(strcat('after Averaging Filter 3X3 , PSNR=',num2str(PSNR1)));
subplot(2,4,3); imshow(f2);
title(strcat('after Averaging Filter 5X5 , PSNR=',num2str(PSNR2)));
subplot(2,4,4); imshow(f3);
title(strcat('after Averaging Filter 7X7 , PSNR=',num2str(PSNR3)));
subplot(2,4,5); imshow(j2); title('Noisy image');
subplot(2,4,6); imshow(f4);
title(strcat('after Averaging Filter 3X3 , PSNR=',num2str(PSNR4)));
subplot(2,4,7); imshow(f5);
title(strcat('after Averaging Filter 5X5 , PSNR=',num2str(PSNR5)));
subplot(2,4,8); imshow(f6);
title(strcat('after Averaging Filter 7X7 , PSNR=',num2str(PSNR6)));
figure;
subplot(2,4,1); imshow(g1); title('Noisy image');
subplot(2,4,2); imshow(f7);
title(strcat('after Averaging Filter 3X3 , PSNR=',num2str(PSNR7)));
subplot(2,4,3); imshow(f8);
title(strcat('after Averaging Filter 5X5 , PSNR=',num2str(PSNR8)));
subplot(2,4,4); imshow(f9);
title(strcat('after Averaging Filter 7X7 , PSNR=',num2str(PSNR9)));
subplot(2,4,5); imshow(g2); title('Noisy image');
subplot(2,4,6); imshow(f10);
title(strcat('after Averaging Filter 3X3 , PSNR=',num2str(PSNR10)));
subplot(2,4,7); imshow(f11);
title(strcat('after Averaging Filter 5X5 , PSNR=',num2str(PSNR11)));
subplot(2,4,8); imshow(f12);
title(strcat('after Averaging Filter 7X7 , PSNR=',num2str(PSNR12)));

%% Gaussian Filter
h1 = fspecial('gaussian', 3, 1);
h2 = fspecial('gaussian', 5, 2);
h3 = fspecial('gaussian', 7, 3);

f1=imfilter(j1,h1,'symmetric','full');
f2=imfilter(j1,h2,'symmetric','full');
f3=imfilter(j1,h3,'symmetric','full');
f4=imfilter(j2,h1,'symmetric','full');
f5=imfilter(j2,h2,'symmetric','full');
f6=imfilter(j2,h3,'symmetric','full');
f7=imfilter(g1,h1,'symmetric','full');
f8=imfilter(g1,h2,'symmetric','full');
f9=imfilter(g1,h3,'symmetric','full');
f10=imfilter(g2,h1,'symmetric','full');
f11=imfilter(g2,h2,'symmetric','full');
f12=imfilter(g2,h3,'symmetric','full');
% PSNR
a1=double(f1); a2=double(f2); a3=double(f3); a4=double(f4);
a5=double(f5); a6=double(f6); a7=double(f7); a8=double(f8);
a9=double(f9); a10=double(f10); a11=double(f11); a12=double(f12);
for i=1:m1;
    for j=1:n1;
        num1=num1+((abs(k1(i,j)-a1(i,j)))^2);
        num2=num2+((abs(k1(i,j)-a2(i,j)))^2);
        num3=num3+((abs(k1(i,j)-a3(i,j)))^2);
        num4=num4+((abs(k2(i,j)-a4(i,j)))^2);
        num5=num5+((abs(k2(i,j)-a5(i,j)))^2);
        num6=num6+((abs(k2(i,j)-a6(i,j)))^2);
        num7=num7+((abs(k1(i,j)-a7(i,j)))^2);
        num8=num8+((abs(k1(i,j)-a8(i,j)))^2);
        num9=num9+((abs(k1(i,j)-a9(i,j)))^2);
        num10=num10+((abs(k2(i,j)-a10(i,j)))^2);
        num11=num11+((abs(k2(i,j)-a11(i,j)))^2);
        num12=num12+((abs(k2(i,j)-a12(i,j)))^2);
    end
end
MSE1=round(num1/(m1*n1));
MSE2=round(num2/(m1*n1));
MSE3=round(num3/(m1*n1));
MSE4=round(num4/(m2*n2));
MSE5=round(num5/(m2*n2));
MSE6=round(num6/(m2*n2));
MSE7=round(num7/(m1*n1));
MSE8=round(num8/(m1*n1));
MSE9=round(num9/(m1*n1));
MSE10=round(num10/(m2*n2));
MSE11=round(num11/(m2*n2));
MSE12=round(num12/(m2*n2));
PSNR1=round(10*(log10((255^2)/MSE1)));
PSNR2=round(10*(log10((255^2)/MSE2)));
PSNR3=round(10*(log10((255^2)/MSE3)));
PSNR4=round(10*(log10((255^2)/MSE4)));
PSNR5=round(10*(log10((255^2)/MSE5)));
PSNR6=round(10*(log10((255^2)/MSE6)));
PSNR7=round(10*(log10((255^2)/MSE7)));
PSNR8=round(10*(log10((255^2)/MSE8)));
PSNR9=round(10*(log10((255^2)/MSE9)));
PSNR10=round(10*(log10((255^2)/MSE10)));
PSNR11=round(10*(log10((255^2)/MSE11)));
PSNR12=round(10*(log10((255^2)/MSE12)));
% show
figure;
subplot(2,4,1); imshow(j1); title('Noisy image');
subplot(2,4,2); imshow(f1); title(strcat('Gaussian Filter 3X3 sigma=1, PSNR=',num2str(PSNR1)));
subplot(2,4,3); imshow(f2); title(strcat('Gaussian Filter 5X5 sigma=2, PSNR=',num2str(PSNR2)));
subplot(2,4,4); imshow(f3); title(strcat('Gaussian Filter 7X7 sigma=3, PSNR=',num2str(PSNR3)));
subplot(2,4,5); imshow(j2); title('Noisy image');
subplot(2,4,6); imshow(f4); title(strcat('Gaussian Filter 3X3 sigma=1, PSNR=',num2str(PSNR4)));
subplot(2,4,7); imshow(f5); title(strcat('Gaussian Filter 5X5 sigma=2, PSNR=',num2str(PSNR5)));
subplot(2,4,8); imshow(f6); title(strcat('Gaussian Filter 3X3 sigma=3, PSNR=',num2str(PSNR6)));
figure;
subplot(2,4,1); imshow(g1);  title('Noisy image');
subplot(2,4,2); imshow(f7);  title(strcat('Gaussian Filter 3X3 sigma=1, PSNR=',num2str(PSNR7)));
subplot(2,4,3); imshow(f8);  title(strcat('Gaussian Filter 5X5 sigma=2, PSNR=',num2str(PSNR8)));
subplot(2,4,4); imshow(f9);  title(strcat('Gaussian Filter 7X7 sigma=3, PSNR=',num2str(PSNR9)));
subplot(2,4,5); imshow(g2);  title('Noisy image');
subplot(2,4,6); imshow(f10); title(strcat('Gaussian Filter 3X3 sigma=1, PSNR=',num2str(PSNR10)));
subplot(2,4,7); imshow(f11); title(strcat('Gaussian Filter 5X5 sigma=2, PSNR=',num2str(PSNR11)));
subplot(2,4,8); imshow(f12); title(strcat('Gaussian Filter 7X7 sigma=3, PSNR=',num2str(PSNR12)));
