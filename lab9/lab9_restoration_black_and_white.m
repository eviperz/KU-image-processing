g = imread("black_and_white.tif");

patch=roipoly(g);
noise_hist = imhist(g(patch));
noise_stat = statmoments(noise_hist,2); 

approx_noise = imnoise(zeros(size(g)),'gaussian',0, noise_stat(2));
Svv = abs(fft2(approx_noise)) .^ 2;

Sff = abs(fft2(double(g))).^ 2;

NSR = Svv ./ Sff;

PSF = fspecial('motion', 180, 0); 
im_out = deconvwnr(g, PSF, NSR);
imshow(im_out);