im1 = imread('hawk.jpg');
im1 = bitshift(im1, -2);
im1 = bitshift(im1, 2);
im2 = imread('kitty.jpg');
im2 = bitshift(im2, -6);
im = bitor(im1, im2);
hide = bitshift(im,6);
imshow([im, hide]);