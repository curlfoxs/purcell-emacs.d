# -*- mode: snippet -*-
# name: dfs on tree
# key: dfst
# --
void dfs(int u=0, int p=-1) {
    for(int v : adj[u])
        if(v^p)
            dfs(v, u);
}