# Fisher-Yates shuffle
function shuffle(xs, n, _, i, j, t) {
    for (i = n; i > 0; --i) {
        j = int(rand() * i) + 1;
        t=xs[i]; xs[i]=xs[j]; xs[j]=t;
    }
}
