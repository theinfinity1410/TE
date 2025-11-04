clc;
clear all;
close all;

N = input("Enter the no of source elements: ");
Q = input("Enter the Channel Matrix P(Y|X): ");
disp(q);
disp("");

P = input("Enter the Source Probability");
Px = diag(P);
disp("P(X): ");
disp(Px);
disp("");

Pxy = Px * Q;
disp("P(X,Y): ");
disp(Pxy);
disp("");

Py = P * Q;
disp("P(Y): ");
disp(Py);
disp("");

Hx = 0;
for i = 1 : N
    if P(i) > 0
        Hx = Hx - P(i) * log2(P(i));
    end
end
disp("Source Entropy H(X): ");
disp(Hx);
disp("");

Hy = 0;
M = length(Py);
for i = 1 : M
    if Py(i) > 0
        Hy = Hy - Py(i) * log2(Py(i));
    end
end
disp("Output Entropy H(Y): ");
disp(Hy); 
disp("");


Hxy = 0;
for i = 1 : N
    for j = 1 : M
        if Pxy(i,j) > 0
            Hxy = Hxy - Pxy(i,j) * log2(Pxy(i,j));
        end
    end
end
disp("Joint Entropy H(X,Y): ");
disp(Hxy);
disp("");

H1 = Hxy - Hx;
disp("Conditional Entropy H(Y|X): ");
disp(H1);
disp("");

H2 = Hxy - Hy;
disp("Conditional Entropy H(X|Y): ");
disp(H2);
disp("");

Ixy = Hx - H2;
disp("Mutual Information I(X;Y): ");
disp(Ixy);
disp("");

if H2 == 0
    disp("The channel is lossless.");
end
if Ixy == 0
    disp("The channel is useless.");
end
if Hx == Hy && H1 == 0
    disp("The channel is noiseless.");
end