im1=imread('mri_txt.tif');
im1 = imadjust(im1, [], [0 1], 0.5);
im1 = histeq(im1);

im2=imread('monet_gray_xlc.jpg');
im2 = imadjust(im2, [], [0 1], 0.8);
im2 = histeq(im2);

subplot(1, 2, 1);
imshow(im1)

subplot(1, 2, 2);
imshow(im2)