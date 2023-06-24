[filename , pathname] = uigetfile({('*.jpg;*.png;*.gif;*.tif;*.bmp')},'Select a pic');
i=imread([pathname filename]);
if size(i,3)>1
    i=rgb2gray(i);
end
%i=imresize(i,[100,100]);
i=im2single(i);
%i=double(i);
c=2;
gamma=1;
i2=c*((i+exp(1))^gamma);

subplot(1,2,1), imshow(uint8(i)), title('before ')
subplot(1,2,2), imshow(uint8(i2)), title('after ')
