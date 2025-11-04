clc;
close all;
clear all;

pkg load communications;

symb = {'A','B', 'C', 'D', 'E'};
prob = [0.4, 0.2, 0.2, 0.1, 0.1];

sym_num = 1 : length(symb);
dict = shannonfanodict(sym_num, prob);

seq = [2,5,1,4];
enc = shannonfanoenco(seq, dict);
dec = shannonfanodeco(enc, dict);
dec_sym = arrayfun(@(x) symbols{x}, dec, 'UniformOutput',false);

disp("Shanno Fano Codes");
for i = 1 : length(symbols)
  fprintf('%s:%s\n', symbols{i}, mat2str(dict{1,i}));
end

p = prob;
entropy = @(p) - sum(p.*log2(p));
Hx = entropy(prob);
len = cellfun(@length, dict(:,2));
avg_len = sum(prob .* len);
eff = Hx / avg_len;

fprintf('Entropy H(X): %4fbits\n', Hx);
fprintf('Average Code Length: %4fbits\n', avg_len);
fprintf('Efficiency: %4f\n', eff);

disp("Encoded Sequence: ");
disp(enc);
disp("Decocded Symbols: ");
disp(dec_sym);