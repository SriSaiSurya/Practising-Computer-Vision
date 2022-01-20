load ('original_image.jpg');
imread('original_image.jpg');		%read image
i= imread('original_image.jpg');
g = rgb2gray(i);
BW1 = edge(g,'sobel', 0.015)          %applies sobel filter to RBG 
BW2 = edge(g,'canny', 0.085);	%applies sobel filter to RBG
figure (1), imshow(i),  title('The Actual image')
figure(2)
subplot(1,2,1), imshow(BW1),  title('The Sobel image')
subplot(1,2,2), imshow(BW2),  title('The Canny image')
