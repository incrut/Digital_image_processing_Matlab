clc;clear;
%1. "Chips" image
%a. Load the "chips.png" image from the folder
img = imread('chips.png');
% imshow(img)

%b. Print the pixel value of the image for all 3 channels (R,G,B) at
%(300,300)
pR300_300 = img(300, 300, 1);
pG300_300 = img(300, 300, 2);
pB300_300 = img(300, 300, 3);


%c. Use subplot function to display the original image, image in red
%channel, image in green channel and image in blue channel of this image
R_channel = img(:, :, 1);
G_channel = img(:, :, 2);
B_channel = img(:, :, 3);
% subplot(2,2,1);imshow(img);title('original');
% subplot(2,2,2);imshow(R_channel);title('red');
% subplot(2,2,3);imshow(G_channel);title('green');
% subplot(2,2,4);imshow(B_channel);title('blue');

%d. Convert the image to grayscale
imgGray = 0.2126* img(:,:,1) + 0.7152*img(:,:,2)  + 0.0722*img(:,:,3);
% imshow(imgGray)

%e. Rotate the grayscale image clock-wise at 45
J = imrotate(imgGray,-45);
% imshow(J)




%2. "Noisy" image
%a. Load the "noise.png" image from the folder
noisy = imread('noise.png');
% imshow (noisy)

%b. Use gaussian filter to reduce the noise from the image
gauss = imgaussfilt(noisy, 2);

%c. Show both the images before and after reducing the noise.
% montage({noisy, gauss});

%d. Save the denoised image using imwrite function
% imwrite(gauss, "denoised.png")
    