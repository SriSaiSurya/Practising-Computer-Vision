load ('original_image.jpg');
imread('original_image.jpg');
i= imread('original_image.jpg');
 Grayi = rgb2gray(i);
imshow(Grayi)
imhist(Grayi)
a=histeq(Grayi); 	%Performing Histogram equalization of gray image
b=imadjust(Grayi,[0.1,0.9],[]);	%Performing Contrast stretching of gray image
imshow(a) 	%viewing Performed histogram equalization
imhist(a)	%viewing histogram of Perfomed histogram equalization
imshow(b)	%viewing Performed Contrast Stretching
imhist(b)	%viewing histogram of Perfomed Contrast Stretching
 subplot(3,2,1), imshow(Grayi),  title('The Original Image')
subplot(3,2,2), imhist(Grayi),  title('Histogram of Original Image')
subplot(3,2,3), imshow(a),  title('The Equalized Image')
subplot(3,2,4), imhist(a),  title('Histogram of Equalized Image')
subplot(3,2,5), imshow(b),  title('The Stretched Contrast image')
subplot(3,2,6), imhist(b),  title('The Histogram of Stretched Contrast Image')