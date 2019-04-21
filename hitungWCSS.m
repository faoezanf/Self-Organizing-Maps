function totalWcss = hitungWCSS(dataset,som)
    % assign jumlah neuron pada variabel 'jumNeuron'
    [jumNeuron, ignoredVariable] = size(som); 
    % inisialisasi 'totalWCSS' dengan 0
    totalWcss = 0;
    
    % berikut adalah perulangan menghitung WCSS pada setiap cluster yg ada
    for i = 1:600
        for j = 1:jumNeuron
             % menghitung jarak input dengan neuron terdekat dengan euclidean
             jarak(j) = sqrt( ((dataset(i,1) - som(j,1))^2) + ((dataset(i,2) - som(j,2))^2) );
             jarak(j) = jarak(j) * jarak(j);
        end
        % mencari dan menghitung jarak terdekat dan assign ke variabel
        % newWcss
        newWcss = min(jarak);
        % pertambahan nilai WCSS
        totalWcss = totalWcss + newWcss;
    end
end