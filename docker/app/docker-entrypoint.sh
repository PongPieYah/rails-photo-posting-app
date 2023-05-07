#!/bin/bash

# バックグラウンドで minio を起動
/minio/minio server /mnt/data --console-address ':9001' &

bundle install --gemfile /workspace/Gemfile
bin/rails db:create RAILS_ENV=development
bin/rails db:migrate RAILS_ENV=development

# 実行後もコンテナを exit させないための処理
tail -f /dev/null
