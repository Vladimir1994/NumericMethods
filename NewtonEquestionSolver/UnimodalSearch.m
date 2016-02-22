function [null, cnt] = UnimodalSearch(fragment)

    E = 1e-6;
    cnt = 1;
    
    if(abs(F(fragment(1))) < E || abs(F(fragment(2))) < E)
        if(F(fragment(1)) < E)
            null = fragment(1);
        end
        if(F(fragment(2)) < E)
            null = fragment(2);
        end
    else 
        curr_point = (fragment(1) + fragment(2)) / 2;
        next_point = NewtonSearchStep(curr_point);
        if(next_point < fragment(1) || next_point > fragment(2))
            [fragment(1), fragment(2)] = halfdiv(fragment(1), fragment(2));
            curr_point = (fragment(1) + fragment(2)) / 2;
        end      
        while(~(abs(next_point - curr_point) < E || ... 
                abs(fragment(1) - fragment(2)) < E))
            cnt = cnt + 1;
            curr_point = next_point;
            next_point = NewtonSearchStep(curr_point);           
            if(next_point < fragment(1) || next_point > fragment(2))
                [fragment(1), fragment(2)] = ...
                    halfdiv(fragment(1), fragment(2));
                curr_point = (fragment(1) + fragment(2)) / 2;
            end
        end
        null = curr_point;
    end   
end

