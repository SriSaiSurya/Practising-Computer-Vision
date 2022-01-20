load ('chocs.jpg');
imread('chocs.jpg');
choco= imread('chocs.jpg');
 
Grayi = rgb2gray(choco);	%converting rgb into Gray scale image
a= im2bw(Grayi);	%converting Grayscale image into binary image
a1= im2bw(Grayi);	%converting Grayscale image into binary image for threshold image 2 
a2=im2bw(Grayi);	%converting Grayscale image into binary image for threshold image 2
imshow(a);
threshold = 80; 			% custom threshold value to 60
a = Grayi > threshold;	%binarize the image by thresholding using grayscale image
threshold = 95;			% custom threshold value to 100
a1 = Grayi > threshold;	%binarize the image by thresholding
threshold = 145;			% custom threshold value to 150
a2 = Grayi > threshold;	%binarize the image by thresholding
figure(1)	%display actual,grayscale and Threshold image
subplot(1,2,1), imshow(choco),  title('The Actual image')
subplot(1,2,2), imshow(Grayi),  title('The Grayscale image')
figure(2), imshow(a),  title('The Threshold image 1')
figure(3), imshow(a1),  title('The Threshold image 2')
figure(4), imshow(a2),  title('The Threshold image 3')
figure(5), imhist(Grayi),  title('The Histogram of Grayscale image')
