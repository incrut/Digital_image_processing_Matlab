
rgb = imread('chips.png');
imshow(rgb);



%%%%%
%%%%% Filter using "imfilter" function
% h = ones(5,5)/25;
% rgb2 = imfilter(rgb,h);
% figure
% imshow(rgb2)

%%%%%
%%%%% Changing the co-ordinates
%%%%% Viewing the co-ordinates
% I = imread('chips.png');
% figure
% ax = imshow(I);
% title("Image Displayed with Intrinsic Coordinates")
% axis on

%%%%% Changing the co-ordinates
% xrange = ax.XData
% yrange = ax.YData
% xrangeNew = xrange + 300;
% yrangeNew = yrange - 75;

%%%%% Viewing the new co-ordinates
% figure
% axNew = imshow(I,"XData",xrangeNew,"YData",yrangeNew);
% title("Image Displayed with Nondefault Coordinates");
% axis on


%%%%%
%%%%% converting to grayscale
imgray = im2gray(rgb);
% figure
% montage({rgb,imgray})

%%%%% Stack both (RGB & grayscale images) on an axis
hFigure = figure;
hAxes = axes("Parent", hFigure);
hImage1 = imshow(rgb, "Parent", hAxes);
drawnow; % Ensure the image gets drawn.
hold on
hImage2 = imshow(imgray, "Parent", hAxes);
hold off

%%%%% Draw circular ROI
centerLocation = [210, 110];
radius = 40;
hC = images.roi.Circle(...
    "Parent", hAxes,...
    "FaceAlpha",0,...
    "Center",centerLocation,...
    "Radius", radius);

%%%%% call "update alpha" function
addlistener(hC,"MovingROI", @updateAlpha);
updateAlpha(hC)

%%%%% zoom the ROI
hC.Parent.XLim = [75 370];
hC.Parent.YLim = [0 205];






%%%%%
%%%%% writing the function

function updateAlpha(hC, ~)
hImages = findobj(hC.Parent,"Type","image");
% Create a BW mask from the Circle ROI
mask = hC.createMask(hImages(1).CData);
% Set the alpha data so that the underlying image shows through
% only inside the circle
set(hImages(1),"AlphaData", ~mask);
end

