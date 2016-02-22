function [m_next, H, S] = Aitken(accuracy, a, b, beta, IntMethod)
    q = 2;
    H1 = 2;
    
    H2 = H1 * q;
    H3 = H2 * q;

    SH1 = Integrate(a, b, H1, beta, IntMethod);
    SH2 = Integrate(a, b, H2, beta, IntMethod);
    SH3 = Integrate(a, b, H3, beta, IntMethod);
    
    S = [SH1 SH2 SH3];
    
    m = 0;
    m_next = log(abs((SH1 - SH2) / (SH2 - SH3))) / log(q);
    cnt = 1;
    
    while(abs(m - m_next) > accuracy) 
        H1 = H2;
        H2 = H3;
        H3 = H2 * q;

        SH1 = SH2;
        SH2 = SH3;
        SH3 = Integrate(a, b, H3, beta, IntMethod);
        S = [S, SH3];
        
        m = m_next;
        m_next = log(abs((SH1 - SH2) / (SH2 - SH3))) / log(q);
        
        cnt = cnt + 1;
    end
    
    H = H2;
end

