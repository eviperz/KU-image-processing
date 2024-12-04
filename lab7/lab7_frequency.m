img_freehdw_noisy = imread("freehdw_noisy.bmp");
img_jupitergray = imread("jupitergray_noisy.bmp");

% 1
img = img_freehdw_noisy;
fftR = fft2(img);
u = 60;
v = 40;
A = 64;
[M,N] = size(img);
for x=1:M 
    for y=1:N
        fnoise(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M)+ ...
            A*sin((2*pi*(u*x + v*y))/N)); 
    end 
end 
 
fft_noise = fft2(fnoise); 
fft_noise_amplitude = log(abs(fft_noise)); 

amplitudeThreshold = 10;
brightSpikes = fft_noise_amplitude < amplitudeThreshold; 

result1 = fftR.*brightSpikes;
result1 = ifft2(result1);
figure(1);imshow(result1,[]);

%2
img = img_jupitergray;
ju_fftR = fft2(img); 
u = 0;
v = 40;
A = 64;
[M,N] = size(img);
for x=1:M 
    for y=1:N
        fnoise_1(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M)+ ...
            A*sin((2*pi*(u*x + v*y))/N)); 
    end 
end

u = 40;
v = 0;
A = 64;
[M,N] = size(img);
for x=1:M 
    for y=1:N
        fnoise_2(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M)+ ...
            A*sin((2*pi*(u*x + v*y))/N)); 
    end 
end

ju_f_noise = fnoise_1.*fnoise_2;
 
ju_fft_noise = fft2(ju_f_noise); 
ju_fft_noise_amplitude = log(abs(ju_fft_noise));
figure(2); imshow(fftshift(ju_fft_noise_amplitude),[]); 


ju_amplitudeThreshold = 16.25;
ju_brightSpikes = ju_fft_noise_amplitude < ju_amplitudeThreshold;
figure(3); imshow(fftshift(ju_brightSpikes),[]); 

result2 = ju_fftR.*ju_brightSpikes;
result2 = ifft2(result2);
figure(4);imshow(result2,[]);