
A = imread("dark.jpg");
% imshow(A)

B = imlocalbrighten(A);
% imshow(B)

% figure
% subplot(1,2,1)
% imhist(A)
% title("Original Image")
% subplot(1,2,2)
% imhist(B)
% title("Brightened Image")

amt = 0.5;
B2 = imlocalbrighten(A,amt);
% 
% figure
% imshow(B2)
% title("Image with Less Brightening")

B3 = imlocalbrighten(A,amt,AlphaBlend=true);
% imshow(B3)
% title("Image with Alpha Blending")

figure
montage({B,B2, B3},Size=[1 3],BorderSize=5,BackgroundColor="w")