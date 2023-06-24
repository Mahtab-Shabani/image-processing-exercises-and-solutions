clear;
close all;
clc;

%% Load Image
[filename , pathname] = uigetfile({'*.gif';'*.png';'*.jpg';'*.tif';'*.bmp';},'Select a pic');
pic=imread([pathname filename]);
if size(pic,3)>1
    pic=rgb2gray(pic);
end

%% Processing
B1 = bitget(pic,1)*2^0;
B2 = bitget(pic,2)*2^1 ;
B3 = bitget(pic,3)*2^2 ;
B4 = bitget(pic,4)*2^3 ;
B5 = bitget(pic,5)*2^4 ;
B6 = bitget(pic,6)*2^5 ;
B7 = bitget(pic,7)*2^6 ;
B8 = bitget(pic,8)*2^7 ;

%% Show Image
subplot(2,4,1), imshow(uint8(B1),[]), title('b0');
subplot(2,4,2), imshow(uint8(B2),[]), title('b1');
subplot(2,4,3), imshow(uint8(B3),[]), title('b2');
subplot(2,4,4), imshow(uint8(B4),[]), title('b3');
subplot(2,4,5), imshow(uint8(B5),[]), title('b4');
subplot(2,4,6), imshow(uint8(B6),[]), title('b5');
subplot(2,4,7), imshow(uint8(B7),[]), title('b6');
subplot(2,4,8), imshow(uint8(B8),[]), title('b7');

%B=B1+B2+B3+B4+B5+B6+B7+B8;
%imshow(B);
