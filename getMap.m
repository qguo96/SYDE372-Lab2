function [ Mesh_Grid_Plot ] = getMap(Sa, Sb, Ma, Mb, X, Y)
    %   General Form of MAP Decision Boundary Equation (ML is a special
    %   case of MAP)
    %   where we find Q0,Q1,Q2,Q3,Q4 values

    rows = size(X, 1);
    columns = size(Y, 2);
    Mesh_Grid_Plot = zeros(rows, size(Y, 2));
    Q_0 = inv(Sa) - inv(Sb);
    Q_1 = 2*(Mb*inv(Sb) - Ma*inv(Sa));
    Q_2 = Ma*inv(Sa)*Ma' - Mb*inv(Sb)*Mb';
    
    for i=1:rows
        for j=1:columns
            X_BAR = [X(i,j), Y(i,j)];
            %If value of the this is 0 then that is where the decision
            %boundary lies between Class A and Class B
            Mesh_Grid_Plot(i,j) = X_BAR*Q_0*X_BAR' + Q_1*X_BAR'+Q_2;
        end
    end
end