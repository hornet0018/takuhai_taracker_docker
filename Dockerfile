# Ruby公式イメージをベースにする
FROM ruby:2.7

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git

# 作業ディレクトリの設定
RUN mkdir /takuhai_tracker
WORKDIR /takuhai_tracker

# ソースコードの取得
RUN git clone https://github.com/tdtds/takuhai_tracker.git .

# Bundlerのインストール
RUN gem install bundler

# Gemfileのインストール
RUN bundle install

# pumaの設定
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
