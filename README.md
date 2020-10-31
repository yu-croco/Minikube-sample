# [WIP]SmpleMiniKube
- minikubeを使用してローカル開発環境でk8s上に2つのAPIサーバーを起動するサンプル


## 構成
```
.
├── README.md
├── app  <-- サンプルアプリケーション
│   ├── golang
│   │   ├── Dockerfile
│   │   └── main.go
│   └── nodejs
│       ├── Dockerfile
│       ├── index.js
│       └── package.json
├── bin
│   ├── docker_builds.sh
│   └── start_minikube.sh
├── deployment  <-- Pod管理
│   ├── golang
│   │   └── server.yml
│   └── nodejs
│       └── server.yml
└── service  <-- service discoveryの管理
    ├── golang
    │   └── server.yml
    └── nodejs
        └── server.yml
```

## セットアップ
- minikubeをローカルPCで使うには、 `minikube` 、 `kubectl` 、 `VirtualBox`の3つが必要
  - minikubeは、VirtualBoxの仮想サーバー上で動作する

### 1.VirtualBoxの準備
- [VirtualBox公式](https://www.virtualbox.org/wiki/Downloads) からダウンロードしてアプリを展開する

### 2.kubectlの準備
- `$ brew install kubectl` でインストール
  - 詳細が知りたい場合には [Homebrewを使用してmacOSへインストールする](https://kubernetes.io/ja/docs/tasks/tools/install-kubectl/#homebrew%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%A6macos%E3%81%B8%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B) も参照ください

### 3.Minikubeの準備
- `$ brew cask install minikube` でインストール
  - 詳細が知りたい場合には [Minikubeのインストール](https://kubernetes.io/ja/docs/tasks/tools/install-minikube/) も参照ください

### 4.minikubeの動作確認
- VM上にminikubeを起動
  - デフォルトのスペックは非常に小さいのでいろいろ拡張するためにscriptを叩く

```
$ ./bin/start_minikube.sh
```

- 起動したminikubeへのダッシュボードが勝手に表示される

```
$ bin/show_minikube_dashboard.sh
```

**TBD**

## その他
### minikubeとは
[Minikubeを使ってローカル環境にKubernetes環境を用意する](https://dev.classmethod.jp/cloud/minikube/) には、

> Minikubeはローカルで簡単にKubernetesを実行できるツールです。
> Kubernetesの検証や開発者のために、ノートPC上のVM環境でシングルノードのKubernetesクラスタを実行します。
> 注意事項としては、シングルノードの環境になるので検証できない機能もあります。
> その場合は適宜クラウド環境に複数ノードでクラスを用意しましょう。 名前的に、小さいKubernetesでミニKubernetesからMinikube？

と書いてある。
要はローカルでk8sをお手軽に使うためのツール

> シングルノードの環境になるので検証できない機能もあります。

とのことで、あくまでも検証用としての位置付けになりそう（冗長化とかはできない）。

### kubernetesの概念
[kubernetesとEKS早わかりまとめ](https://zenn.dev/nameless_gyoza/articles/f22466cadaf60bf50405) にざっくり書いてるので参照してください

### kubernetesを操作するための概念/用語とか
#### マニフェスト
- kubernetes上に構築したいリソースはマニフェストという形でyamlファイルに定義する

#### Deployment
- Podの状態を確認して、Podの作成などを行う

#### Service
- PodのIPをminikubeの仮想環境の外と繋げる
  - デフォルトでは仮想環境内でしか通信できない

### kubectl コマンド一覧
- [kubectl - チートシート](https://kubernetes.io/ja/docs/reference/kubectl/cheatsheet/) を参照ください


## 参考
- [Minikubeを使ってローカル環境にKubernetes環境を用意する](https://dev.classmethod.jp/cloud/minikube/)
- [minikube を MacOSへインストールしてみた](https://qiita.com/MahoTakara/items/895bf2fd7f4a880ac43b)
- [Kubernetes (K8s)](https://kubernetes.io/ja/)
- [Lens](https://k8slens.dev/)
    - k8s用のIDEが割といい感じなので、 `minikube dashboard` の代わりにこちらを使ってもいいかもしれない
