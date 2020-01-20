# Quick sort O(n log n)
function sort(xs) {
    sort_sub(xs, 1, length(xs))
}
function sort_sub(xs, left, right, _, pivot, i, j, t) {
    if (left >= right) return;
    pivot = xs[left]
    i = left
    j = right
    for (;i <= j;) {
        for (;i <= j && xs[i] <= pivot;++i);
        if (i >= j) break;
        for (;j >= i && xs[j] > pivot; --j);
        if (i >= j) break;
        if (i < j && xs[i] > pivot && xs[j] <= pivot) {
            t=xs[i]; xs[i]=xs[j]; xs[j]=t;
        }
        ++i; --j;
    }
    t=xs[i-1]; xs[i-1]=xs[left]; xs[left]=t;
    sort_sub(xs, left, i-2);
    sort_sub(xs, i, right);

}
