{
  programs.nvf.settings.vim = {
    snippets.luasnip = {
      enable = true;
      customSnippets.snipmate = {
        cpp = [
          {
            trigger = "cpp";
            body = ''
              #include <bits/stdc++.h>
              using namespace std;
            '';
          }
        ];

        linkedlist = [
          {
            trigger = "linkedlist";
            body = ''
              struct ListNode {
                  int val;
                  ListNode *next;
                  ListNode() : val(0), next(nullptr) {}
                  ListNode(int x) : val(x), next(nullptr) {}
                  ListNode(int x, ListNode *next) : val(x), next(next) {}
              };
            '';
          }
        ];

        cp_template = [
          {
            trigger = "cp";
            body = ''
              #include <bits/stdc++.h>
              using namespace std;

              #define ios                     ios::sync_with_stdio(0); cin.tie(0); cout.tie(0)

              using ll = long long;
              using pii = pair<int, int>;
              using vi = vector<int>;
              using vll = vector<ll>;

              #define all(x) x.begin(), x.end()
              #define rep(i, a, b) for(int i = a; i < b; ++i)
              #define repr(i, a, b) for(int i = a; i >= b; --i)
              #define pb push_back
              #define sz(x) (int)(x).size()

              #ifdef LOCAL
                  #define debug(x) cerr << #x << " = " << x << "\n"
              #else
                  #define debug(x)
              #endif

              const int MOD = 1e9 + 7;
              const int INF = 1e9;
              const ll LINF = 1e18;

              void solve() {
              }

              int main() {
                  ios;
                  int t = 1;
                  cin >> t;
                  while (t--) {
                      solve();
                  }
                  return 0;
              }

            '';
          }
        ];


      };
    };
  };

}
