function [weight,wcss] = SelfOrganizingMaps(dataset, totalNeuron, jumlahEpoch, awalLearningRate, radius)
    % inisialisasi nilai 'learningAwal'.
    learningAwal = awalLearningRate; 
    % inisialisasi nilai 'topologi'.
    topologi = radius;
    % inisialisasi nilai 't_learningRate'.
    t_learningRate = 1000;
    % inisialisasi nilai 't_topologi'.
    t_topologi = t_learningRate/log(topologi);

    % assign jumlah baris dan kolom dataset kedalam variabel 'jumBaris' dan
    % 'jumKolom'.
    [jumBaris, jumKolom] = size(dataset);
    % random nilai 0 sampai 1 sebagai weight awal dari setiap neuron.
    weight = rand(totalNeuron,jumKolom);
    % inisialisasi awal variabel 'currentLearning' dengan nilai
    % 'learningAwal'
    learningTerkini = learningAwal;
    % inisialisasi awal variabel 'currentTopologi' dengan nilai
    % 'topologi'
    topologiTerkini = topologi;
    
    % Berikut adalah perulangan dalam melakukan proses learning
    for t=1:jumlahEpoch
        
        % random index berisi integer antara 1 sampai 600
        randomIndex = randi(jumBaris,1,1);
        % assign nilai titik pada index yang dirandom sebelumnya
        nilaiDataRandom = dataset(randomIndex,:);
        % proses mencari pemenang neuron
        indexPemenang = cariWinnerNeuron(nilaiDataRandom,weight);
        
        % Berikut adalah perulangan untuk menghitung jarak dan update
        % weight
        for s=1:totalNeuron
        
            % proses menghitung jarak
            jarak = exp( -( abs(distance(indexPemenang,s)) / (2*(topologiTerkini(t)^2)) ) );
            % proses update weight yang baru
            weight(s,:) = weight(s,:) + (learningTerkini(t)*jarak*(nilaiDataRandom-weight(s,:)));
            
        end
        
        % proses update learning rate
        learningTerkini(t+1) = learningAwal * exp(-t/t_learningRate);
        % proses update topologi
        topologiTerkini(t+1) = topologi * exp(-t/t_topologi);

    end
    
    % proses menghitung nilai WCSS setiap cluster
    wcss = hitungWCSS(dataset,weight);
end