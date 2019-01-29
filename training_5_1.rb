# よく使われるイディオム
## 条件分岐で変数に代入/&.演算子
## 具体例

def find_currency(country)
  currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
  currencies[country]
end

def show_currency(country)
  currency = find_currency(country)
  # nilでない事をチェック、nilであるとメソッドが呼び出せないため
  if currency
    currency.upcase!
  end
end

puts show_currency(:japan) #⇛YEN
puts show_currency(:italy) #nil

### 上記では以下の事を行っている
# ①show_currencyメソッドを(:japan)を引数として呼び出す
# ②show_currencyメソッド内で、変数currencyが定義され、右辺ではfind_currencyメソッドが仮引数country今回だと(:japan)を受け取り呼び出される
# ③find_currencyに仮引数countryを受け取り、処理が実行される
# ④currencies[country]が戻り値としてcurrencyに代入
# ⑤if文の中でcurrencyがnilでなければ、upcaseメソッドが処理される

### 上記のコードでも問題は無いが、rubyでは変数への代入自体が戻り値をもつため、以下のようにif文の中で直接変数に代入することができる
def show_currency(country)
  if currency = find_currency(country)
    currency.upcase!
  end
end

### 更に上記のコードは&.演算子を使ってnilであればnilを、そうでない場合はメソッドを呼び出す
def show_currency(country)
  currency = find_currency(country)
  # currencyがnilの場合を考慮して&.演算子でメソッドを呼び出す
  currency&.upcase
end

## ||=を使った自己代入 頻出！

limit ||= 10
puts limit #⇛10
### これはlimitがfalseもしくはnilであれば10を代入、それ以外の場合はlimitをそのまま使うという意味になる

### 例
limit = false
limit ||= 10
puts limit #⇛10

limit = 20
limit ||= 10
puts limit #⇛20

### これは論理演算子の||が指揮全体の真偽値が確定した時点で式の評価を終了し、その時の値を戻り値として返す仕組みが使われている
### limit = limit || 10 というふうに展開できる

## !!を使った真偽値の型変換
# ユーザーが存在するかどうかの独自メソッドを定義したい場合
def user_exist?
  user = find_user
  if user
    true
  else
    false
  end
end

### 上記のコードは以下にまとめられる

def user_exist?
  !!find_user
end

### !!はtrueもしくはfalseに変換するものである

