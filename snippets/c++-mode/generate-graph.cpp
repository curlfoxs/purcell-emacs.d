# -*- mode: snippet -*-
# name: generate graph
# key: gg
# --
for(int i=0; i<m; ++i) {
    int u, v;
    cin >> u >> v, --u, --v;
    adj[u].push_back(v);
    adj[v].push_back(u);
}