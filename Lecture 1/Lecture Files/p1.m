
clc;clear;

%%%%
%%%% Loading the image
img = imread('cat.png');
imshow(img)

%%%%
%%%% Rotating the image
% J = imrotate(img,60);
% imshow(J)
 

%%%%
%%%% Swapping RGB channels
%temp = img;
%temp(:, :, 1) = img(:, :, 3);
%temp(:, :, 3) = img(:, :, 1);
%imshow(temp);


%%%%
%%%% Viewing different channels of an image
%img = imread('rgb.png');
% R_channel = img(:, :, 1);
% G_channel = img(:, :, 2);
% B_channel = img(:, :, 3);
% subplot(2,2,1);imshow(img);title('original');
% subplot(2,2,2);imshow(R_channel);title('red');
% subplot(2,2,3);imshow(G_channel);title('green');
% subplot(2,2,4);imshow(B_channel);title('blue');
%[Rchannel, Gchannel, Bchannel] = imsplit(img);
%imshow(Rchannel)

%%%% Showing only R channel
%img(:,:,[2 3]) = 0;
%imshow(img) 


%%%%
%%%% Grayscale images
% imgGray = 0.2126* img(:,:,1) + 0.7152*img(:,:,2)  + 0.0722*img(:,:,3);
% imshow(imgGray)
% imgGray = rgb2gray(img);
% imgback2rgb = gray2ind(imgGray);
% imshow(imgback2rgb)

%%%%
%%%% Getting pixel values of an image
% pvr = img(300,500,1);
% pvg = img(300,500,2);
% pvb = img(300,500,3);
% sprintf('pixel value red is %d',pvr)
% sprintf('pixel value green is %d',pvg)
% sprintf('pixel value blue is %d',pvb)

% imgGray = rgb2gray(img);
% pvgr = imgGray(500,1000);
% sprintf('pixel value grayscale is %d',pvgr)


%Noise Reduction in images
gc = imread('noisy.png');
% gray_cat= rgb2gray(img1);
gauss = imgaussfilt(gc, 2);
montage({gc, gauss});
gauss = imgaussfilt(imgGray, 2);
montage({imgGray, gauss});


%%%%
%%%% Construct an image
% imgGray = rgb2gray(img);
% imgd = double(imgGray);
% [rws,clumns] = size(imgd);
% zimg = zeros(size(imgd));
% imshow(zimg)
% random_points = rand(rws.*clumns, 1)<0.20;
% zimg(random_points) = imgd(random_points);
% gauss_filter = fspecial('gaussian', [10,10], 2);
% convolution_with_gauss_filter = conv2(gauss_filter, zimg);
% subplot(2,2,1),imagesc(imgd); axis image; axis off; colormap(gray); title('original');
% subplot(2,2,2),imagesc(zimg); axis image; axis off; colormap(gray); title('object points');
% subplot(2,2,3),imagesc(convolution_with_gauss_filter); axis image; axis off; colormap(gray); title('response with gauss');


%%%%
%%%% Create Mask for an image
% imgSize = size(img);
% mask = zeros(imgSize,'uint8');
% rows = imgSize(1);
% mask(floor(rows/2):rows, :, :) = 1;
% masked = img .* mask;
% imshow(masked)

%%%%
%%%%Displaying top half of the image
% imgSize = size(img);
% sprintf('size is %d', imgSize)
% rowHzlfPoint = floor(imgSize(1)/2) ;
% imgTopHalfDynamic = img(1:rowHzlfPoint,:,:);
% imshow(imgTopHalfDynamic)

%%%%
%%%%Masking left/right half of the image
% sizeOfImg = size(img);
% mask = zeros(sizeOfImg, 'uint8');
% columnsHalfPoint = floor(sizeOfImg(2)/2);
% mask(:,columnsHalfPoint:sizeOfImg(2),:) = 1;
% mask(:,1:columnsHalfPoint,:) = 0;
% imgMasked = img.*mask;
% imshow(imgMasked)


%%%%
%%%%Binary masking of the image
% imgSize = size(img);
% binaryMask = ones(imgSize, 'uint8');
% binaryMaskSize = size(binaryMask);
% binaryMask(:,1:binaryMaskSize(2)/2,:) = 2;
% maskedImage = binaryMask.*img;
% imshow(maskedImage)

 
%display part of an image
%imshow(img); 
% % (row, column, channel)
%imgFirstRow = img(1,:,:);
% imgFirst100 = img(1:100,:,:); 
% imshow(imgFirst100);


%Noise Reduction in images
% gc = imread('noisy.png');
% gray_cat= rgb2gray(img1);
% gauss = imgaussfilt(gc, 2);
% montage({gc, gauss});
% gauss = imgaussfilt(imgGray, 2);
% montage({imgGray, gauss});


%%%%
%%%% Construct an image
% imgGray = rgb2gray(img);
% imgd = double(imgGray);
% [rws,clumns] = size(imgd);
% zimg = zeros(size(imgd));
% imshow(zimg)
% random_points = rand(rws.*clumns, 1)<0.20;
% zimg(random_points) = imgd(random_points);
% imshow(zimg)
% gauss_filter = fspecial('gaussian', [10,10], 2);
% convolution_with_gauss_filter = conv2(gauss_filter, zimg);
% subplot(2,2,1),imagesc(imgd); axis image; axis off; colormap(gray); title('original');
% subplot(2,2,2),imagesc(zimg); axis image; axis off; colormap(gray); title('object points');
% subplot(2,2,3),imagesc(convolution_with_gauss_filter); axis image; axis off; colormap(gray); title('response with gauss');
