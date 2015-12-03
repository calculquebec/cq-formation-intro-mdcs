tic
spmd
    m = 100000;
    a = 0;
    b = pi/2;
    dx = (b-a)/m;

    n = m/numlabs;
    Delta = (b-a)/numlabs;    % dx * n

    ai = a + (labindex - 1)*Delta;
    bi = a + labindex*Delta;

    x = ai+dx/2:dx:bi-dx/2;

    int = sum(cos(x)*dx);
    int = gplus(int, 1);
end
toc

disp(1-int{1})
