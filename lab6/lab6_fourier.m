img_lion = imread("lion-cub.jpg");
img_curve = imread("curve_brighter.jpg");
img_flower = imread("images.jpg");
img_wood = imread("wood-room.jpg");
img_wink = imread("background.jpg");
img_bubble = imread("bubble.jpg");

% first
phase = fft2(img_lion);
magnitude = fft2(img_curve);
fft_lion_curve = (abs(magnitude)).*exp(1i*angle(phase));
img_lion_curve = ifft2(fft_lion_curve);
img_lion_curve = uint8(img_lion_curve);

figure(1);
imshow(img_lion_curve);
title('img_lion_curve');

% second
fft_wood = fft2(img_wood);
fft_flower = fft2(img_flower);
fft_flower_wood = fft_flower + fft_wood;

fft_f = (abs(fft_flower)).*exp(1i*angle(fft_wood));
fft_s = (abs(fft_f)).*exp(1i*angle(fft_flower_wood));
img_flower_wood = ifft2(fft_s);
img_flower_wood = uint8(img_flower_wood);

figure(2);
imshow(img_flower_wood);
title('img_flower_wood');

% third
img_wink_bubble = img_wink + img_bubble;

figure(3);
imshow(img_wink_bubble);
title('img_wink_bubble');
