% vidDev = videoinput('winvideo',1,'YUY2_640x480');
% set (vidDev ,'FramesPerTrigger',Inf);
% set (vidDev ,'ReturnedColorspace','rgb');
% % start(video);
red_Threshold = 0.24; % Threshold for red detection
green_Threshold = 0.05; % Threshold for green detection
blue_Threshold = 0.15; % Threshold for blue detection
vidDev = imaq.VideoDev('winvideo', 1, 'YUY2_640x480', ... % Acquire input video stream
                    'ROI', [1 1 640 480], ...
                    'ReturnedColorSpace', 'rgb');
vidInformation = imaqhwinfo(vidDev); % Acquire input video property
hblob = vision.BlobAnalysis('AreaOutputPort', false, ... % Set blob analysis handling
                                'CentroidOutputPort', true, ...
                                'BoundingBoxOutputPort', true', ...
                                'MinimumBlobArea', 600, ...
                                'MaximumBlobArea', 3000, ...
                                'MaximumCount', 10);
hshapeinsBox = vision.ShapeInserter('BorderColorSource', 'Input port', ... % Set box handling
                                        'Fill', true, ...
                                        'FillColorSource', 'Input port', ...
                                        'Opacity', 0.4);
% htextinsGreen = vision.TextInserter('Text', 'Green : %2d', ...
%                                      'Location',  [5 18], ...
%                                      'Color', [0 1 0], ...
%                                    'Font', 'Courier New', ...
%                                    'FontSize', 14);
hVideoIn = vision.VideoPlayer('Name', 'Final Video', ... % Output video player
                                'Position', [100 100 vidInfo.MaxWidth+20 vidInfo.MaxHeight+30]);
nFrame = 0; % Frame number initialization
while(nFrame < 300)
    rgbFrame = step(vidDev); % Acquire single frame
    rgbFrame = flipdim(rgbFrame,2); % obtain the mirror image for displaying
    diffFrameGreen = imsubtract(rgbFrame(:,:,2), rgb2gray(rgbFrame)); % Get green component of the image
    diffFrameGreen = medfilt2(diffFrameGreen, [1 1]); % Filter out the noise by using median filter
    binFrameGreen = im2bw(diffFrameGreen, greenThresh); % Convert the image into binary image with the green objects as white
    binFrameGreen = bwareaopen(binFrameGreen,130); % removing of all pixel less than 130
%     bw = bwlable(binFrameGreen,8);
    stats= regionprops(binFrameGreen,'BoundingBox','Centroid','Area','Perimeter');
    [centroidGreen, bboxGreen] = step(hblob, binFrameGreen); % Get the centroids and bounding boxes of the green blobs
    centroidGreen = uint16(centroidGreen); % Convert the centroids into Integer for further steps
   rgbFrame(1:50,1:90,:) = 0;% put a black region on the output stream
    vidIn = step(hshapeinsBox, rgbFrame, bboxGreen, single([0 1 0])); % Instert the green box
%  for object = 1:1:length(bboxGreen(:,1)) % Write the corresponding centroids for green
%         centXGreen = centroidGreen(object,1);
%         centYGreen = centroidGreen(object,2);
%         vidIn = step(htextinsCent, vidIn, [centXGreen centYGreen], [centXGreen-6 centYGreen-9]);
%  end
%    
%  vidIn = step(vidIn, uint8(length(bboxGreen(:,1)))); % Count the number of green blobs
   step(hVideoIn, vidIn); % Output video stream
   nFrame = nFrame+1;
end
%% Clearing Memory
release(hVideoIn); % Release all memory and buffer used
release(vidDev);
clear all;
clc;
