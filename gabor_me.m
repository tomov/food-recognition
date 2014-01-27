
lambda  = 10;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 6;

gabors = {};

bws = [1];

figure
for i = 1:N
    for j = 1:size(bws, 2)
        subplot(4, N, i + (j - 1) * N);
        bw = bws(j);
        gb = gabor_fn(bw,gamma,psi(1),lambda,i * 2*pi/N)...
                + 1i * gabor_fn(bw,gamma,psi(2),lambda,i * 2*pi/N);
        gabors{end+1} = gb;
    end
end
