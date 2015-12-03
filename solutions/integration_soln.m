    tic
spmd
    m = 100000;
    a = 0;
    b = pi/2;
    n = m/numlabs;
    Delta = (b-a)/numlabs;
    ai = a + (labindex - 1)*Delta;
    bi = a + labindex*Delta;
    dx = (b-a)/m;
    x = ai+dx/2:dx:bi-dx/2;
    int = sum(cos(x)*dx);
    int = gplus(int, 1);
end
disp(1-int{1})
toc
