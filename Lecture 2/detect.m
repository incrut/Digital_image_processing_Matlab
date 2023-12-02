rgb = imread('chips.png');

%%%%%
%%%%% Converting to grayscale
gray_image = im2gray(rgb);
imshow(gray_image)

%%%%%
%%%%% Detection Sensitivity
[centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","dark")

[centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","dark", ...
    "Sensitivity",0.9)

imshow(rgb)
h = viscircles(centers,radii);

%%%%%
%%%%% Increase Detection Sensitivity
[centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","dark", ...
    "Sensitivity",0.92);

length(centers)

delete(h)  % Delete previously drawn circles
h = viscircles(centers,radii);

%%%%%
%%%%% 2 stage Method
[centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","dark", ...
          "Sensitivity",0.92,"Method","twostage");

delete(h)
h = viscircles(centers,radii);
%%%%%
%%%%% Finding bright circles
[centersBright,radiiBright] = imfindcircles(rgb,[20 25], ...
    "ObjectPolarity","bright","Sensitivity",0.92);

%%%%%
%%%%% Draw bright circles with different colors
imshow(rgb)

hBright = viscircles(centersBright, radiiBright,"Color","b");

