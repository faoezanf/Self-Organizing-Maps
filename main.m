clc; clear all; % hapus command window dan variabel sebelumnya dalam workspace
% load file dataset
data = csvread("Tugas 2 ML Genap 2018-2019 Dataset Tanpa Label.csv",0);

% proses klaster dimulai ketika total klaster = 2, tidak dari 1. Hal ini
% dikarenakan konsep klasterisasi dilakukan ketika kelas / label / klaster
% nya lebih dari 1. Alasan lainnya adalah penulis telah mengobservasi WCSS1
% memiliki nilai tinggi yang terlalu ekstrim jika akan dibandingkan dengan
% WCSS2 dan seterusnya.

[som2,wcss2] = SelfOrganizingMaps(data,2,100000,1,10);      % Proses Clustering SOM dengan sejumlah 2 neuron
[som3,wcss3] = SelfOrganizingMaps(data,3,100000,1,10);      % Proses Clustering SOM dengan sejumlah 3 neuron
[som4,wcss4] = SelfOrganizingMaps(data,4,100000,1,10);      % Proses Clustering SOM dengan sejumlah 4 neuron
[som5,wcss5] = SelfOrganizingMaps(data,5,100000,1,10);      % Proses Clustering SOM dengan sejumlah 5 neuron
[som6,wcss6] = SelfOrganizingMaps(data,6,100000,1,10);      % Proses Clustering SOM dengan sejumlah 6 neuron
[som7,wcss7] = SelfOrganizingMaps(data,7,100000,1,10);      % Proses Clustering SOM dengan sejumlah 7 neuron
[som8,wcss8] = SelfOrganizingMaps(data,8,100000,1,10);      % Proses Clustering SOM dengan sejumlah 8 neuron
[som9,wcss9] = SelfOrganizingMaps(data,9,100000,1,10);      % Proses Clustering SOM dengan sejumlah 9 neuron
[som10,wcss10] = SelfOrganizingMaps(data,10,100000,1,10);   % Proses Clustering SOM dengan sejumlah 10 neuron
[som11,wcss11] = SelfOrganizingMaps(data,11,100000,1,10);   % Proses Clustering SOM dengan sejumlah 11 neuron
[som12,wcss12] = SelfOrganizingMaps(data,12,100000,1,10);   % Proses Clustering SOM dengan sejumlah 12 neuron
[som13,wcss13] = SelfOrganizingMaps(data,13,100000,1,10);   % Proses Clustering SOM dengan sejumlah 13 neuron
[som14,wcss14] = SelfOrganizingMaps(data,14,100000,1,10);   % Proses Clustering SOM dengan sejumlah 14 neuron
[som15,wcss15] = SelfOrganizingMaps(data,15,100000,1,10);   % Proses Clustering SOM dengan sejumlah 15 neuron

% Penggabungan nilai WCSS dalam satu array bernama 'optimumCluster'
optimumCluster = [wcss2,wcss3,wcss4,wcss5,wcss6,wcss7,wcss8,wcss9,wcss10,...
                  wcss11,wcss12,wcss13,wcss14,wcss15];

% Proses visualisasi data WCSS dalam array 'optimumCluster'
plot(optimumCluster);

% Jika ingin melihat grafik hasil cluster dari sebuah neuron yang sudah ditetapkan,
% misalkan jumlah klaster = 8, maka jalankan fungsi visualisasiData();
% dengan parameter yang digunakan adalah som8, dan datasetnya.
% Setelah program di RUNNING, agar grafik / plot WCSS tetap ditampilkan, jalankan
% kode dibawah ini dalam COMMAND WINDOW :

%visualisasiData(som8,data);