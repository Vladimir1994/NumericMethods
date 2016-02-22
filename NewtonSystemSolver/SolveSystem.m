function [root_point] = SolveSystem(start_point)
    E = 1e-12; 
    delta_point = linsolve(dF(start_point), - F(start_point));
    root_point = delta_point + start_point;
    
    while(abs(root_point - start_point) > E)
        start_point = root_point;
        delta_point = linsolve(dF(start_point), -F(start_point));
        root_point = delta_point + start_point;
    end
end

