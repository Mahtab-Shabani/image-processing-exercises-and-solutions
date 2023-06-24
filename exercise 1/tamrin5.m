close all;
clear all;
clc;
I=imread('lowContrastPollen.jpg');
I=double(I);
%% SLIDE 16, Piecewise-Linear Transformation functions
L=256;
p1=round(0.35*L);
p2=round(0.7*L);
s1=round(0.1*p1);
s2=round(2*p2);

ALFA=s1/p1;% Tr1=ALFA*(r-p1)+s1
BETA=((s2-s1)/(p2-p1));%Tr2=(BETA*(r-p2))+s2
GAMMA=(((L-1)-s2)/((L-1)-p2));% Tr3=(GAMMA*(r-(L-1)))+(L-1)

[m,n]=size(I);
Tr=zeros(m,n);
for i=1:m;
    for j=1:n;
        r=I(i,j);
        if r<p1
            Tr(i,j)=round(ALFA*r);
        elseif r==p1
            Tr(i,j)=s1;
        elseif (r>p1 && r<p2)
            Tr(i,j)=round((BETA*(r-p1))+s1);
        elseif r==p2
            Tr(i,j)=s2;
        else
            Tr(i,j)=round((GAMMA*(r-p2))+s2);
        end
    end
end

Tr=uint8(Tr);
figure;
subplot(1,2,1), imshow(uint8(I)), title('Orginal image');
subplot(1,2,2), imshow(Tr), title('slide 16, Piecewise-Linear Transformation');

%% SLIDE 17, Change Histogram
I=imread('flwr.jpg');
I=rgb2gray(I);
I=double(I);
[m,n]=size(I);

Tr=zeros(m,n);
for i=1:m;
    for j=1:n;
        r=I(i,j);
        if r<50
            Tr(i,j)=0;
        elseif (r>=50 && r<100)
            Tr(i,j)=50;
        elseif (r>=100 && r<150)
            Tr(i,j)=100;
        elseif (r>=150 && r<200)
            Tr(i,j)=150;
        else
            Tr(i,j)=200;
        end
    end
end
Tr=uint8(Tr);
figure;
subplot(1,2,1), imshow(uint8(I)), title('Orginal image');
subplot(1,2,2), imshow(Tr), title('SLIDE 17, Change Histogram');

%% SLIDE 18, Grey level Slicing Transformation 1
I=imread('blood.gif');
I=double(I);
[m,n]=size(I);

s1=0;
r1=0;
s2=round(.6*L);
r2=round(.9*L);
BETA=(s2-s1)/(r2-r1); % Tr=(BETA*(r-r1))+s1

Tr=zeros(m,n);
for i=1:m;
    for j=1:n;
        r=I(i,j);
        if (r>50 && r<130)
            Tr(i,j)=s2;
        else
            Tr(i,j)=round((BETA*(r-r1))+s1);
        end
    end
end
Tr=uint8(Tr);
figure;
subplot(1,2,1), imshow(uint8(I)), title('Orginal image');
subplot(1,2,2), imshow(Tr), title('SLIDE 18, Grey level Slicing Transformation 1');

%% SLIDE 19, Grey level Slicing Transformation 2
I=imread('blood.gif');
I=double(I);
[m,n]=size(I);

s1= round(.035*L);
s2= round(.4*L);
r1=round(.2*L);
r2=round(.5*L);
r3=round(.9*L);
Tr=zeros(m,n);
for i=1:m;
    for j=1:n;
        r=I(i,j);
        if (r<r1 || (r>r2 && r<r3))
            Tr(i,j)=round(s1);
        elseif r>r3
            Tr(i,j)=0;
        else
            Tr(i,j)=s2;
        end
    end
end
Tr=uint8(Tr);
figure;
subplot(1,2,1), imshow(uint8(I)), title('Orginal image');
subplot(1,2,2), imshow(Tr), title('SLIDE 19, Grey level Slicing Transformation 2');
