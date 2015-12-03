Ga = rand(20000,10000,'single');
tic;
Gfft = fft(Ga); 
G = gather(Gfft);
toc


Ga = rand(20000,10000,'single','gpuArray');
tic;
Gfft = fft(Ga); 
G = gather(Gffty);
toc



