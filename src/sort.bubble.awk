# Bubble sort O(n^2)
func sort(xs, _, i, j, t) {
    for (i = 0; i < length(xs); ++i) {
        for (j = 1; j < length(xs); ++j) {
            if (xs[j] > xs[j+1]) {
                t=xs[j]; xs[j]=xs[j+1]; xs[j+1] = t;
            }
        }
    }
}
