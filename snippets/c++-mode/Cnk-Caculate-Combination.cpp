# -*- mode: snippet -*-
# name: Cnk - Caculate Combination
# key: cnk
# --
ll fact[mxN];

void genFact() {
    fact[0]=1;
    for(int i=1; i<=pow(10, 5); ++i)
        fact[i]=(fact[i-1]*i)%M;
}
ll powM(ll x, ll y, int M) {
    ll r=1;
    while(y) {
        if(y&1) {
            r=(r*x)%M;
        }
        x=(x*x)%M;
        y/=2;
    }
    return r;
}
ll inv(ll x) {
    return powM(x, M-2, M);
}
ll Cnk(int n, int k, int M) {
    return fact[n]*inv(fact[k])%M*inv(fact[n-k])%M;
}
