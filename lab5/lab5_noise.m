img = imread("girl_gray.jpg");
h = fspecial("average");

img1 = imadjust(img, [0.4 0.9], [0 0.8]);
img1 = imfilter(img1, h);

img2 = histeq(img1);

img3 = adapthisteq(img1);

imshow([img, img3, img2, img1])

img_space = imread("space2.jpg");
im = imadjust(img_space,[0.1 0.4], [0 1]);
im = imfilter(im, h);
im2 = adapthisteq(im);

imshow([img_space, im, im2]);