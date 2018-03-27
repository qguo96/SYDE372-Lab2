function [estimation] = classifyClasses(J,X,Y,discriminants,true_n_ab,true_n_ba)
    estimation = 0;
    while (J < prod(size(discriminants)))
        a_mu = discriminants{J}(1,:);
        b_mu = discriminants{J}(2,:);  
        
        estimation = getMed(X,Y,a_mu,b_mu);
        if (estimation == 1 && true_n_ba{J} == 0)
            break;
        end
        if (estimation == 2 && true_n_ab{J} == 0)
            break;
        end
        J = J + 1;
    end
end