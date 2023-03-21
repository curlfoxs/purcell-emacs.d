# -*- mode: snippet -*-
# name: dp-ZeorIndexed
# key: dp0
# --
dp[0][0]=1; // Initialize
for(int i=0; i<n; ++i) {
    for(int j=0; j<m; ++j) {
        if(i) // Left Cases
            dp[i][j]+=dp[i-1][j];
        if(j) // Top Cases
            dp[i][j]+=dp[i][j-1];
        dp[i][j]%=M;
        if(s[i][j]=='*') // Exception Cases
            dp[i][j]=0;
    }
}
