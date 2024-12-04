total=0;
for i = 1:300
    filename = ['C:\coding\image-processing\lab2\lab2-noise averaging\puppy_' num2str(i) '.jpg'];
    im=imread(filename);
    im=double(im);
    total=total+im;
end
total=total/300;
im=uint8(total);
imshow(im);
