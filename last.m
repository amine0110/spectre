 clear all; close all; clc;

image1 = imread('image1.tif');%figure, imshow(image1);
image2 = imread('image2.tif');%figure, imshow(image2);
image3 = imread('image3.tif');%figure, imshow(image3);
image4 = imread('image4.tif');%figure, imshow(image4);
image5 = imread('image5.tif');%figure, imshow(image5);

pixels = [image1(100,100), image2(100,100), image3(100,100), image4(100,100), image5(100,100)];
% figure, plot(pixels)  
%%
RGB(:, :, 1) = image2; 
RGB(:, :, 2) = image1; 
RGB(:, :, 3) = image4; 
% figure, imshow(RGB);
%% %% camera calib test 1 
S = zeros(81, 10);
for n = 1:10
    S(:, n) = xlsread('Color_checher_gamin_08-03-2008.xls',n, 'B1:B81');
end
%% 1) on applique la méthode: on prend une colonne arbitraire du fichier excel:
V =xlsread('Color_checher_gamin_08-03-2008.xls',11, 'B1:B81');
sudo_S =  pinv(S);
H = sudo_S * V
%%
S_star = H *  V';
%% 2) calcul de l'erreur:(hypothése)
delta_S =  abs(sudo_S - S_star); %sum(H);
error = sum(sum(delta_S)) / prod(size(delta_S))