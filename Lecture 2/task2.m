

%Tasks for the day

%1. Region of Interest - "chips.png"
    %a. Highlight or circle the last orange chip as shown in image
    %"chip_focus.png"
    %b. Zoom-in the highlighted orange chip as shown in image
    %"chip_focus2.png"

rgb = imread('chips.png');
imgray = im2gray(rgb);
hFigure = figure;
hAxes = axes("Parent", hFigure);
hImage1 = imshow(rgb, "Parent", hAxes);
drawnow; % Ensure the image gets drawn.
hold on
hImage2 = imshow(imgray, "Parent", hAxes);
hold off

%%%%% Draw circular ROI
centerLocation = [421, 345];
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
% hC.Parent.XLim = [376 511];
% hC.Parent.YLim = [200 415];

function updateAlpha(hC, ~)
hImages = findobj(hC.Parent,"Type","image");
mask = hC.createMask(hImages(1).CData);
% Set the alpha data so that the underlying image shows through
% only inside the circle
set(hImages(1),"AlphaData", ~mask);
end




% ______________________________________________________________________________________




%2. Brightening - "ll.jpg"
    %a. Brighten the "ll.jpg" image
    %b. Use "montage" or "subplot" function to display all 4 types of the
    %image

% A = imread("ll.jpg");
% B = imlocalbrighten(A);
% amt = 0.5;
% B2 = imlocalbrighten(A,amt);
% B3 = imlocalbrighten(A,amt,AlphaBlend=true);
% montage({A, B,B2, B3},Size=[1 4],BorderSize=5,BackgroundColor="w")


% ______________________________________________________________________________________


%3. Chip Detection - "chips.png"
% Highlight/circle all the chips (all colors) in the image "chips.png"
    %a. To highlight all "yellow" chips, set the "EdgeThreshold" value to
    %"0.1".
    %c. Once you have highlighted all "yellow" colored chips, super-impose 
    % the already-obtained image by called the "viscircles" function.

% rgb = imread('chips.png');
% 
% gray_image = im2gray(rgb);
% imshow(gray_image)
% 
% [centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","bright", "EdgeThreshold", 0.1, ...
%     "Sensitivity",0.93)
% 
% imshow(rgb)
% h = viscircles(centers,radii);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],"ObjectPolarity","dark", ...
%     "Sensitivity",0.935);
% h = viscircles(centers,radii);
