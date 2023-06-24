[filename , pathname] = uigetfile({'*.png';'*.jpg';'*.gif';'*.tif';'*.bmp';},'Select a pic');
i=imread([pathname filename]);
if size(i,3)>1
    i=rgb2gray(i);
end
i2=double(i);
%c=46;
c=1;
i2=c*log(i2+1);
subplot(1,2,1), imshow(uint8(i)), title('before ')
subplot(1,2,2), imshow(uint8(i2),[]), title('after ')
