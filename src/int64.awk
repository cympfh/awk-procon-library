# 64bit signed int
BEGIN {
    E = 10000
}
function int64(x, _, i, xs, sign) {
    if (substr(x, 1, 1) == "-") {
        sign = -1
        x = substr(x, 2, length(x) - 1)
    } else {
        sign = 1
    }
    x = "00000000000000000000" x
    x = substr(x, length(x) - 19)
    for (i = 1; i <= 5; ++i) {
        xs[i] = substr(x, i * 4 - 3, 4) * sign
    }
    return normalize(xs)
}
function normalize(xs, _, i, ac) {
    for (i = 5; i > 1; --i) {
        if (xs[i] >= E) {
            xs[i-1] += int(xs[i] / E)
            xs[i] %= E
        } else if (xs[i] < 0) {
            ac = int((-xs[i] + E - 1) / E)
            xs[i-1] -= ac
            xs[i] += ac * E
        }
    }
    return xs[1] ":" xs[2] ":" xs[3] ":" xs[4] ":" xs[5]
}
function sign(x, _, xs, i) {
    split(x, xs, ":")
    if (xs[1] < 0) return -1
    for (i = 1; i <= 5; ++i) if (xs[i] > 0) return 1
    return 0
}
function neg(x, _, i, xs) {
    split(x, xs, ":")
    for (i = 1; i <= 5; ++i) xs[i] *= -1
    return normalize(xs)
}
function add(x, y, _, i, xs, ys) {
    split(x, xs, ":")
    split(y, ys, ":")
    for (i = 1; i <= 5; ++i) xs[i] += ys[i]
    return normalize(xs)
}
function mul(x, y, _, i, j, k, xs, ys, zs) {
    split(x, xs, ":")
    split(y, ys, ":")
    for (k = 1; k <= 9; ++k) {
        zs[k] = 0
    }
    for (i = 1; i <= 5; ++i) {
        for (j = 1; j <= 5; ++j) {
            zs[i + j - 1] += xs[i] * ys[j]
        }
    }
    for (i = 9; i > 1; --i) {
        if (zs[i] >= E) {
            zs[i-1] += int(zs[i] / E)
            zs[i] %= E
        } else if (zs[i] < 0) {
            ac = int((-zs[i] + E - 1) / E)
            zs[i-1] -= ac
            zs[i] += ac * E
        }
    }
    for (i = 2; i <= 5; ++i) {
        zs[1] = zs[1] * E + zs[i]
        zs[i] = zs[i + 4]
    }
    return normalize(zs)
}
function to_int(x) {
    split(x, xs, ":")
    if (xs[1] < 0) return "-" to_int(neg(x))
    x = sprintf("%04d%04d%04d%04d%04d", xs[1], xs[2], xs[3], xs[4], xs[5])
    sub(/^0*/, "", x)
    if (x == "") return "0"
    return x
}
function lt(x, y, _, i) {
    split(x, xs, ":")
    split(y, ys, ":")
    for (i = 1; i <= 5; ++i) {
        if (xs[i] < ys[i]) return 1
        else if (xs[i] > ys[i]) return 0
    }
    return 0
}
