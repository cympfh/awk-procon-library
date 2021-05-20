# Bubble sort O(n^2)
function sort(xs, n, _, i, j, t) {
    for (i = 0; i < n; ++i) {
        for (j = 1; j < n; ++j) {
            if (xs[j] > xs[j+1]) {
                t=xs[j]; xs[j]=xs[j+1]; xs[j+1] = t;
            }
        }
    }
}
