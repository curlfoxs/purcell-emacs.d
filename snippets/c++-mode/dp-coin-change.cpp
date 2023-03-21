# -*- mode: snippet -*-
# name: dp-coin-change
# key: dpc
# --
dp[0]=0; // Initialize
for(int i=0; i<n; ++i) {
    for(int j=c[i]; j<=s; ++j) {
        dp[j]=min(dp[j], 1+dp[j-c[i]]);
    }
}
