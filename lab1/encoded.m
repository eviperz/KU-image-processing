im = imread('coded_image_2.tif');
im1 = bitshift(im, 3);
im2 = bitshift(im, 7);
imshow([im, im1, im2])
