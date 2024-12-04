im = imread("eun_hae.png");
N=10;
threshRGB = multithresh(im,N);
value = [0 threshRGB(2:end) 255];  
quantRGB = imquantize(im, threshRGB, value);
h=fspecial("prewitt");
A1 = imfilter(im, h.');
A2 = imfilter(im, h.');
h=fspecial("sobel");
B = imfilter(im, h);
h=fspecial("laplacian");
C = imfilter(im, h);
h=fspecial("log");
D = imfilter(im, h);

filter = (A1 + A2 + B + D)*2;
im = quantRGB - filter;
imshow(im);