%% Details about the processing

% Histogram Equalisation of an image, is a spatial image enhancement method.
%The transfromation function in this method is to be plotted. There is no such
%constant in this method, which can be tuned to get the desired image. 
% This is a wholistic approach.

clear all
clc

lookup_tab=0;
transformed=0;
count=0;

%% Computer program for Histogram plotting
I=imread('fractured_spine.tif'); % Reading an image

I_forhist=reshape(I,[size(I,1)*size(I,2),1]);
figure;subplot(1,2,1);imshow(I);title('Input image');
hold on; 
subplot(1,2,2);hist(I_forhist,0:255);title('Histogram of an input image');
xlabel('Gray-levels');ylabel('Frequency');
hold off;
        
%% Implementation of Histogram Equalisation 

% Counting the occurance of each intensity (bin) of an image
for k = 0:1:255
    lookup_tab(k+1,1)=size(I(I==k),1)/(size(I,1)*size(I,2));
    lookup_tab(k+1,2)=k;
end

%Cumulative summation
cs=cumsum(lookup_tab(:,1));
for k = 0:1:255   
%     transformed(k+1,1)=uint8(round(double(max(I(:)))*sum(lookup_tab(1:(k+1),1))));
    transformed(k+1)=uint8(round(double(max(I(:)))*cs(k+1)));
end

% Histogram equalization
for i = 1:1:size(I,1)
    for j = 1:1:size(I,2)
        I_equalized(i,j)=transformed(I(i,j)+1);
    end
end

figure;
subplot(1,3,1); imshow(I);
title('Original Image');
subplot(1,3,2); imshow(I_equalized,[]);
title('Equalized Coded Image');
subplot(1,3,3); stairs((0:255),transformed); xlim([0 255]);ylim([0 255]);
title('Transformation Function');


I_forhist_tran=reshape(I_equalized,[size(I_equalized,1)*size(I_equalized,2),1]);
figure;subplot(1,2,1);imshow(I_equalized,[]);title('Equalised Gray-scale image');
hold on; 
subplot(1,2,2);hist(I_forhist_tran,0:255);title('Histogram of after equalisation image');
xlabel('Equalised Gray-levels');ylabel('Frequency');
hold off;