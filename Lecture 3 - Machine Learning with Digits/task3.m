
syntheticDir   = fullfile(toolboxdir('vision'),'visiondata','digits','synthetic');
handwrittenDir = fullfile(toolboxdir('vision'),'visiondata','digits','handwritten');
trainingSet = imageDatastore(syntheticDir,'IncludeSubfolders',true,'LabelSource','foldernames');
testSet     = imageDatastore(handwrittenDir,'IncludeSubfolders',true,'LabelSource','foldernames');

img = readimage(trainingSet, 206);
%1. Calculate the number of features HOG can generate for:
    %a. hog_4x4
[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);
len_hog_4x4 = length(hog_4x4);
disp(strcat('Number of features of hog_4x4 is-', int2str(len_hog_4x4)))
    %b. hog_2x2
[hog_2x2, vis2x2] = extractHOGFeatures(img,'CellSize',[2 2]);
len_hog_2x2 = length(hog_2x2);
disp(strcat('Number of features of hog_2x2 is-',int2str(len_hog_2x2)))

[hog_8x8, vis8x8] = extractHOGFeatures(img,'CellSize',[8 8]);
len_hog_8x8 = length(hog_8x8);
disp(strcat('Number of features of hog_8x8 is-',int2str(len_hog_8x8)))

cellSize4 = [4 4];
cellSize8 = [8 8];
cellSize2 = [2 2];
%2. Calculate the accuracy for the digit "5" from confusion matrix for:
    %a. hog_4x4
numImages = numel(trainingSet.Files);
trainingFeatures = zeros(numImages,len_hog_4x4,'single');

for i = 1:numImages
    img = readimage(trainingSet,i);
    img = im2gray(img);
    %% Apply pre-processing steps
    img = imbinarize(img);
    trainingFeatures(i, :) = extractHOGFeatures(img,'CellSize',cellSize4);  
end
trainingLabels = trainingSet.Labels;
classifier = fitcecoc(trainingFeatures, trainingLabels);
[testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, len_hog_8x8, cellSize8);
% [testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, len_hog_2x2, cellSize2);
% [testFeatures, testLabels] = helperExtractHOGFeaturesFromImageSet(testSet, len_hog_4x4, cellSize4);
predictedLabels = predict(classifier, testFeatures);
confMat = confusionmat(testLabels, predictedLabels);
helperDisplayConfusionMatrix(confMat)

    %b. hog_2x2

%3. Which hog feature channel (hog_2x2, hog_4x4 & hog_8x8) gives the better
%accuracy for predicting digit "5"?

%  Hog feature channel hog_2x2 gives better accuracy for predicting digit
%  '5' as it provides more information for the prediction



%%%%% Support Functions
function helperDisplayConfusionMatrix(confMat)
% Display the confusion matrix in a formatted table.

% Convert confusion matrix into percentage form
confMat = bsxfun(@rdivide,confMat,sum(confMat,2));

digits = '0':'9';
colHeadings = arrayfun(@(x)sprintf('%d',x),0:9,'UniformOutput',false);
format = repmat('%-9s',1,11);
header = sprintf(format,'digit  |',colHeadings{:});
fprintf('\n%s\n%s\n',header,repmat('-',size(header)));
for idx = 1:numel(digits)
    fprintf('%-9s',   [digits(idx) '      |']);
    fprintf('%-9.2f', confMat(idx,:));
    fprintf('\n')
end
end

function [features, setLabels] = helperExtractHOGFeaturesFromImageSet(imds, hogFeatureSize, cellSize)
% Extract HOG features from an imageDatastore.

setLabels = imds.Labels;
numImages = numel(imds.Files);
features  = zeros(numImages,hogFeatureSize,'single');

% Process each image and extract features
for j = 1:numImages
    img = readimage(imds,j);
    img = im2gray(img);
    
    % Apply pre-processing steps
    img = imbinarize(img);
    
    features(j, :) = extractHOGFeatures(img,'CellSize',cellSize);
end
end