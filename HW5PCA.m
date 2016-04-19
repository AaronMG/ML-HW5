clear all;
clc;

points = [0 0;-1 2;-3 6;1 -2;3 -6];
plot(points(:,1), points(:,2), '*');

load('USPS.mat','A','L');
im=reshape(A(2,:),16,16);
imshow(im);
[coeff,scores,~,~,~,mu] = pca(A);
p = [10 50 100 200];
for i = 1: length(p)
    rec = A*coeff(:,1:p(i)) * transpose(coeff(:,1:p(i)));
    for j = 1:2
        figure
        im = reshape(rec(j,:), 16, 16);
        imshow(im);
        err(i,j) = norm(A(j,:) - rec(j,:),'fro')^2;
    end    
   error(i) = norm((A-rec),'fro')^2;
end
close all;