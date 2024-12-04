total=0;
for i = 1:50
    filename = ['C:\coding\image-processing\lab2\lab2-long exposure\' num2str(i) '.jpg'];
    im=imread(filename);
    im=double(im);
    total=total+im;
end
total=total/50;
im=uint8(total);
imshow(im);