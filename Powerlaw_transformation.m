%% Details about the processing

% Power-Law Transformation of an image, is a spatial image enhancement method.The
%transfromation function in this method is c*(r^v). Here, "c" and "v" can be any
%constant value and "r" is the input intensity level (or gray level in this
%case) of an input image. 

% Pointwise image processing will be applied.
clear all
clc
%% Implementation of Power-Law Transformation (Selecting the best value of Gamma- ?)

I=imread('fractured_spine.tif'); % Reading an image
Inorm=double(I)/double(max(I(:))); % Image normalization

% Taking constant c and varying v
v=linspace(0.1,1.0,10); % Taking various values of constant "v"
c=1; % Taking 1 as the value of constant "c"
for i=1:1:size(v,2)
    Ipow_transformed(:,:,i)=double(max(I(:)))*c*(Inorm.^v(1,i)); %Log-transformation
end
% Plotting from here
figure; 
%sgtitle('Keeping a fixed value of constant- c and varying Gamma');
for i=1:1:size(Ipow_transformed,3)
    subplot(round(size(Ipow_transformed,3)/round(size(Ipow_transformed,3)/2)),round(size(Ipow_transformed,3)/2),i);
    imshow(uint8(Ipow_transformed(:,:,i)));title(sprintf('c=%d and Gamma=%d',c,v(1,i)));hold on
end
hold off

%% Implementation of Power-Law Transformation (Selecting the best value of Constant - C for ?=0.4)

% Taking constant v and varying c
v=0.4; % Taking various values of constant "v"
c=linspace(1,3,10); % Taking 1 as the value of constant "c"
for i=1:1:size(c,2)
    Ipow_transformed(:,:,i)=double(max(I(:)))*c(1,i).*(Inorm.^v); %Log-transformation
end

% Plotting from here
figure();
%sgtitle('Keeping a fixed value of Gamma and varying constant- c');
for i=1:1:size(Ipow_transformed,3)
    subplot(round(size(Ipow_transformed,3)/round(size(Ipow_transformed,3)/2)),round(size(Ipow_transformed,3)/2),i);
    imshow(uint8(Ipow_transformed(:,:,i)));title(sprintf('c=%d and Gamma=0.4',c(1,i)));hold on
end
figure(); imshow(I);