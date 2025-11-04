clc;
clear all;
close all;

k = input("Enter no of msg bits: ");
n = input("Enter no of code bits: ");
disp("Enter the parity matrix: ")
P = input("");

Ik = eye(k);
Ink = eye(n - k);
G = [Ik P];
H = [P' Ink];

disp("Generator Matrix G: ");
disp(G);
disp("Parity Matrix H: ");
disp(H);

m = de2bi(0 : (2^k - 1), k, 'left-msb');
C = mod(m * G, 2);
disp("All possible Codewords: ");
disp(C);

w = sum(C, 2);
disp('Hamming Weights: ');
disp(w');

dmin = min(w (w > 0));
fprintf("Min Hamming Distance = %d\n\n", dmin);

r = input("Enter the received codeword: ");
s = mod(r * H', 2);
fprintf("Syndrome: ");
disp(s);

if all(s == 0)
  disp("Recieved codeword is valid");
else
  pos = find(ismember(H', s, 'rows'));
  if ~isempty(pos)
    fprintf("Single bit error detected at position %d\n", pos);
    r(pos) = mod(r(pos) + 1, 2);
    disp("COrrected codeword: ");
    disp(r);
  end
end