# -*- mode: snippet -*-
# name: dp-interval
# key: dpi
# --
// Initialize
for(int i=n-1; ~i; --i) {
    for(int j=i; j<n; ++j) {
        if(j>i) {
            for(int k=i+1; k<=j; ++k) {
                ;
            }
        }
    }
}
