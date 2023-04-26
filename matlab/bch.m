function bch(reference)

n = 255;
k = 187;

%reference = '11111110101100100011111011101101001100101000010101000000001101011011000000111110010000011101000111111111100101101010111010001010101000000010100010000010001010100001100010';
%reference = input('', 's');

bits = str2num(fliplr(reference)')';

b = gf(bits);
enc = bchenc(b, n, k);

syndrome = (enc(k + 1 : end) == ones(1, n - k));
disp(char(fliplr(syndrome) + '0'));
