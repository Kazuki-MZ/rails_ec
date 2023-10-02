# ECサイトを実装

<img width="950" alt="スクリーンショット 2023-10-02 17 24 32" src="https://github.com/kazu1212-star/rails_ec/assets/115007915/1b244fd6-50aa-4866-8ae2-830c1415a3cb">


# 環境構築
## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000
