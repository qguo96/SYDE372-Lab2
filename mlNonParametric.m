function [ boundary ] = mlNonParametric(al_pdf, bl_pdf, cl_pdf )
%MLNONPARAMETRIC Summary of this function goes here
%   Detailed explanation goes here
boundary = zeros(size(al_pdf, 1), size(al_pdf, 2));

for i = 1:size(al_pdf, 1)
    for j = 1:size(al_pdf, 2)
        if (al_pdf(i,j) > bl_pdf(i,j) && al_pdf(i,j) > cl_pdf(i,j))
            boundary(i, j) = 1;
        elseif (bl_pdf(i,j) > al_pdf(i,j) && bl_pdf(i,j) > cl_pdf(i,j))
            boundary(i, j) = 2;
        elseif (cl_pdf(i,j) > al_pdf(i,j) && cl_pdf(i,j) > bl_pdf(i,j))
            boundary(i, j) = 3;
        end
    end
end
end

