function winner = cariWinnerNeuron (nilaiDataRandom,som)
    % assign jumlah neuron di variabel 'jumNeuron'
    [jumNeuron, ignoredVariable] = size(som);
    % assign baris weight
    nilaiBarisDiWeight = som(1,:);
    % inisialisasi neuron pemenang dengan 1
    winner = 1;
    
    % berikut adalah perulangan untuk mencari neuron pemenang dengan input
    % yang terdekat.
    for n=1:jumNeuron
        bobot = norm(nilaiDataRandom-som(n,:),2);
        if bobot<nilaiBarisDiWeight
            nilaiBarisDiWeight = bobot;
            winner = n;
        end
    end
end