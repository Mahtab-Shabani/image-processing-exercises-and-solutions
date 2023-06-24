close all hidden;
clear all;
clc;
%%
numerator=0;
A=imread('peppers.gif');
subplot(2,3,1);
imshow(A);
title('Orgial image');

A=double(A);
for k=1:5
    a=imread(strcat(cd,'\','peppers',int2str(k),'.gif'));        
    a=double(a);
    for i=1:512;
        for j=1:512;
            numerator=numerator+((abs(A(i,j)-a(i,j)))^2);
        end
    end
    MSE=round(numerator/(512*512));
    PSNR=round(10*(log10((255^2)/MSE)));
    subplot(2,3,k+1);
    imshow(uint8(a));
    title(strcat('MSE=',num2str(MSE),' and PSNR=',num2str(PSNR)));
end
