A = cm';
B = bsxfun(@rdivide,A,sum(A));
C = imresize(1 - B, 15, 'method', 'box');
imshow(C);
xlabel('Targets');
ylabel('Outputs');


[b, ib] = sort(diag(B));
sprintf('%.2f %% bottom 10', mean(b(1:10) * 100))
sprintf('%.2f %% top 10', mean(b(41:50) * 100))

sprintf('%.2f %% correct', (1 - c) * 100)

