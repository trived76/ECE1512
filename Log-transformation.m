%% Details about the processing

% Log-transformation of an image, is a spatial image enhancement method.The
%transfromation function in this method is c*log(1+r). Here, "c" can be any
%constant value and "r" is the input intensity level (or gray level in this
%case) of an input image. 

% Pointwise image processing will be applied.
clear all
clc
%% Implementation of Log-Transformation

I=imread('fractured_spine.tif'); %Reading an image
Inorm=double(I)./double(max(I(:))); %Image normalization
c=linspace(1.5,5,8); %Taking various values of constant "c" %best 4.5
for i=1:1:size(c,2)
    Ilog_transformed(:,:,i)=c(1,i)*(log(1+Inorm)); %Log-transformation
end

% Plotting from here
for i=1:1:size(Ilog_transformed,3)
    subplot(round(size(Ilog_transformed,3)/round(size(Ilog_transformed,3)/2)),round(size(Ilog_transformed,3)/2),i);
    imshow(Ilog_transformed(:,:,i)); title(sprintf('Log-transform with Constant= %d',c(i))); hold on
end
hold off
figure(); imshow(I);