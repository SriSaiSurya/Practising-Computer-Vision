[index,map]= rgb2ind(i,50);
imshow(index);
subplot(1,2,2)
imshow(index);
colormap(map)
load('original_image.jpg');
imread('original_image.jpg');
im =imread('original_image.jpg');
subplot(1,2,1)
imshow(i)
title('The Actual image') 		%Display Actual image
[index,map]= rgb2ind(i,50);	%Display Indexed image with %50 colours
subplot(1,2,2)	%Shows indexed image in subplot
imshow(index);
colormap(map)
title('The Indexed image')