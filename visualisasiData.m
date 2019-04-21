function grafik = visualisasiData(som, trainingData)
    % menampilkan persebaran dataset dalam grafik
    scatter(trainingData(:,1), trainingData(:,2));
    hold on;
    
    % berikut adalah perulangan untuk membuat garis antar neuron
    for i=1:size(som, 1)-1
        line([som(i,1), som(i+1,1)], [som(i,2), som(i+1,2)], 'Color', 'r', 'LineWidth', 2.0);
    end
    % menampilkan neuron dan garis antar neuronnya ke grafik
    scatter(som(:,1), som(:,2), 'MarkerFaceColor', 'y');
    hold off
end