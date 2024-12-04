im = imread('chest_gray.jpg');

im1 = imadjust(im,[0.1 0.6],[0 1]);

im2 = adapthisteq(im);
imshow([im, im1, im2])