function [r1, r2, i1, i2] = func_root_find(A, B, C)
    % A, B ve C katsayýlarýna sahip ikinci dereceden bir polinomun köklerini bulan fonksiyon
    
    % x sembolünü tanýmla
    syms x;
    
    % Ýkinci dereceden polinomu ifade et
    polynomial = A * x^2 + B * x + C;
    
    % Polinomu ekrana yazdýr
    fprintf('F(X) = ');
    disp(polynomial);

    % A katsayýsý sýfýr ise, denklem ikinci dereceden deðil
    if A == 0
        disp('Denklem 2. dereceden deðil.');
    else
        % roots fonksiyonu kullanarak kökleri bul
        roots_vector = roots([A, B, C]);
        
        % Gerçel ve karmaþýk kökleri ayýr
        r1 = real(roots_vector(1));
        i1 = imag(roots_vector(1));
        r2 = real(roots_vector(2));
        i2 = imag(roots_vector(2));
        
        % Kökleri ekrana yazdýr
        fprintf('Kök 1: r1 = %.4f + %.4fi\n', r1, i1);
        fprintf('Kök 2: r2 = %.4f + %.4fi\n', r2, i2);
    end
end