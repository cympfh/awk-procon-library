# Fisher-Yates shuffle
function shuffle(xs, _, i, j, t) {
    for (i = length(xs); i > 0; --i) {
        j = int(rand() * i) + 1;
        t=xs[i]; xs[i]=xs[j]; xs[j]=t;
    }
}
