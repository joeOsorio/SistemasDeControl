
% 1 Dada la función de transferencia: 


    %a) Representación de la función G(s) utilizando el comando tf.
    num = [1 8 15];
    den = [1 7 14 8 0];
    G1 = tf(num, den);
    
    %b) Repita el paso anterior, utilizando el formato polo-cero zpk.
    
    %raices 
    %roots_den = roots(den);
    % 0 -1  -2 -4
    %roots_den = roots(num);
    % -5 -3 
    zero = [-5 -3];
    pole= [0 -1 -2 -4] ;
    gain = 1;
    sys= zpk(zero,pole, gain);
    
    
    %c) Utilizar comandos tf2zp y zp2tf para conversión entre modelos
    
    [z,p,k]=tf2zp(num, den);
    
    zp2tf(z,p,k);
    
    
    %d) Obtenga la respuesta a las entradas impulso y escalón. Utilizar comandos impulse y step respectivamente.
    
    impulse(G1)
    title("Funcion impulso")
    
    step(G1)
    title("Funcion escalon")

% II
    B1 = tf([2 0], [3 0 10]);
    B2 = tf([3],[1 2]);
    B3 = tf([2],[1 4 4]);
    B4 = tf([1 2],[1 1]);
    B5 = tf([2.5]);

    A1=feedback(B1,B5,-1);
    A2=series(A1,B2);
    A3=parallel(A2,B4);
    A4= feedback(A3,1,-1);

    step(A4)
    impulse(A4)
    
    figure;
    subplot(3,1,1)
    impulse(A4)

    subplot(3,1,2)
    step(A4)

    subplot(3,1,3)

    t=linspace(0,10,30);
    u=t;

    lsim(A4,u,t)
    