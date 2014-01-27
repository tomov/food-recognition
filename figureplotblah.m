X = rand(500, 2) * 100;

opts = statset('Display','final');

cats = 5;

[idx,ctrs] = kmeans(X,cats,...
                    'Distance','city',...
                    'Replicates',5,...
                    'Options',opts);
                

colors = ['r.'; 'b.'; 'g.'; 'c.'; 'm.'];

figure;
hold on
for i=1:cats
    plot(X(idx==i,1),X(idx==i,2),colors(i,:),'MarkerSize',12)
end

legend('Cluster 1','Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5','Centroids',...
           'Location','NW');
   
       
plot(ctrs(:,1),ctrs(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs(:,1),ctrs(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
axis([0 100 0 100]);
 
hold off;