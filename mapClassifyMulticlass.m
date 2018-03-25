function [Z] = mapClassifyMulticlass(x,y,Class_C_D_ML,Class_D_E_ML,Class_E_C_ML)
    Z = zeros(size(x,1), size(y,2));    
    for i = 1:size(x,1)
        for j = 1:size(y,2)
            if Class_C_D_ML(i,j) >= 0 && Class_D_E_ML(i,j) <= 0
                Z(i,j) = 1;
            elseif Class_D_E_ML(i,j) >= 0 && Class_E_C_ML(i,j) <= 0
                Z(i,j) = 2;
            elseif  Class_E_C_ML(i,j) >= 0 && Class_C_D_ML(i,j) <= 0
                Z(i,j) = 3;
            end
        end
    end
end