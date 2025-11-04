clc;
clear all;
close all;

pkg load communications;

sym = {'A', 'B', 'C', 'D', 'E'};
pro = [0.4, 0.2, 0.2, 0.1, 0.1];

sym_num = 1 : length(sym);
dict = huffmandict(sym_num, pro);

seq = [2,1,2,4];
enc_seq = huffmanenco(seq, dict);
dec_seq = huffmandeco(enc_seq, dict);
dec_sym = arrayfun(@(x) sym{x}, dec_seq, 'UniformOutput', false);

disp('Huffman Codes: ')
for i = 1 : length(sym)
  fprintf('%s:%s\n',sym{i},mat2str(dict{1,i}));
end

p = pro;
entropy = @(p) - sum(p .* log2(p));
Hx = entropy(pro)
len = cellfun(@length, dict(:, 2));
avg_len = sum(pro .* len);
eff = Hx / avg_len;

fprintf('Entropy H(X): %4fbits\n', Hx);
fprintf('Average Code Length: %4fbits\n', avg_len);
fprintf('Efficiency: %4f\n', eff);

disp("Encoded Sequence: ");
disp(enc_seq);
disp("Decocded Symbols: ");
disp(dec_sym);