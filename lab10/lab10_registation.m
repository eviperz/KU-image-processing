ref_image = imread("image_054_year_1.png");
moving_image = imread("image_054_year_2.png");

% gray_scale
img_gray_ref = rgb2gray(ref_image);
img_gray_moving = rgb2gray(moving_image);

% select point
[movingPoints , fixedPoints] = cpselect(moving_image , ref_image,'wait',true);

% transformation
tform = fitgeotform2d(movingPoints,fixedPoints,"reflectivesimilarity");

% create 3 different output
sameAsInput = affineOutputView(size(moving_image),tform,"BoundsStyle","sameAsInput");

% recover Image
B = imwarp(img_gray_moving,tform,'OutputView',sameAsInput);

subplot(1, 3, 1);
imshowpair(img_gray_ref, img_gray_moving);
title('Before registration');

subplot(1, 3, 2);
imshowpair(ref_image, B);
title('After registration');

subplot(1, 3, 3);
imshowpair(ref_image, B, 'diff')
title('The difference between two images');