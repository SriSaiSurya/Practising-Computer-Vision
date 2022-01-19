title('The Indexed image')
grayi = rgb2gray(i);
imshow(grayi);
title('The Gray-scale image')
im= imread('original_image.jpg');
subplot(1,2,1)
imshow(i);
title('The Actual image')		%Display Actual image
Grayi = rgb2gray(i);	%convert RBG to grayscale image
subplot(1,2,2)
imshow(Grayi);
title('The Gray-scale image')

[x,y] = size(Grayi);			%obtain length and width
X = 1:x;
Y = 1:y;
[xx,yy] = meshgrid(Y,X);	%length and width based on 2-D grid coordinates 
figure();						%plot brigthness profile
mesh(xx,yy,Grayi)
