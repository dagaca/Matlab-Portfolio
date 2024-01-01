function [r1, r2, i1, i2] = func_root_find(A, B, C)
    % A, B ve C katsay�lar�na sahip ikinci dereceden bir polinomun k�klerini bulan fonksiyon
    
    % x sembol�n� tan�mla
    syms x;
    
    % �kinci dereceden polinomu ifade et
    polynomial = A * x^2 + B * x + C;
    
    % Polinomu ekrana yazd�r
    fprintf('F(X) = ');
    disp(polynomial);

    % A katsay�s� s�f�r ise, denklem ikinci dereceden de�il
    if A == 0
        disp('Denklem 2. dereceden de�il.');
    else
        % roots fonksiyonu kullanarak k�kleri bul
        roots_vector = roots([A, B, C]);
        
        % Ger�el ve karma��k k�kleri ay�r
        r1 = real(roots_vector(1));
        i1 = imag(roots_vector(1));
        r2 = real(roots_vector(2));
        i2 = imag(roots_vector(2));
        
        % K�kleri ekrana yazd�r
        fprintf('K�k 1: r1 = %.4f + %.4fi\n', r1, i1);
        fprintf('K�k 2: r2 = %.4f + %.4fi\n', r2, i2);
    end
end