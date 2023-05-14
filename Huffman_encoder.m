function [encoded_file,dict] = Huffman_encoder(input)

% input 
% encoded_file : output the final stream of the huffman encoder 
% dict : the dictionary for the encoded file

% Get the symbols from the run-length stream:
symbols = [];
for i = 1 : 1 : length(input)  
    if find(symbols == input(i))
    else
        symbols = [symbols input(i)];
    end    
end

% calulate the freq. for each symbol:
freq = zeros(1,length(symbols));
for i = 1:1:length(input)
    char_indx = find(symbols == input(i));
    freq(char_indx) = freq(char_indx)+1;
end
freq = freq/ sum(freq);

% Use huffmandict to create binary code for each symbol based on its freq.:
[dict , ave] = huffmandict(symbols,freq);

% Use huffman encoder:
encoded_file = huffmanenco(input,dict);

end