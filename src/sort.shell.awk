# Shell Sort (n log^2(n))
function sort(xs, n, _, i, j, t, gaps) {
    for (i = 1; i <= n; ++i) gaps[i] = 0;
    gaps[1] = 1;
    for (i = 1; i <= n/2; ++i) {
        if (gaps[i]) gaps[i * 2] = gaps[i * 3] = 1;
    }
    for (gap = int(n/2); gap >= 1; --gap) {
        if (!gaps[gap]) continue
        for (i = 1; i <= gap; ++i) {
            for (j = i; j + gap <= n; j += gap) {
                if (xs[j] > xs[j + gap]) {
                    t=xs[j]; xs[j]=xs[j+gap]; xs[j+gap]=t;
                }
            }
        }
    }
}
