load ('original_image.jpg');
imread('original_image.jpg');
i= imread('original_image.jpg');
Grayi = rgb2gray(i);	%converting rgb into Gray scale image
a= im2bw(Grayi);	%converting Grayscale image into binary image
b= im2bw(Grayi);
imshow(a);
threshold = 130; 			% custom threshold value to 120
b = Grayi > threshold;	%binarize the image by thresholding
threshold = 160;			% custom threshold value to 170
b = Grayi > threshold;
figure(1)	%display actual,grayscale and Threshold image
subplot(2,2,1), imshow(i),  title('Actual image')
subplot(2,2,2), imshow(Grayi), title('Grayscale image')
subplot(2,2,3), imshow(a),  title('Threshold image 1')
subplot(2,2,4), imshow(b),  title('Threshold image 2')
figure(2),imhist(Grayi),  title('Histogram of Grayscale image')
