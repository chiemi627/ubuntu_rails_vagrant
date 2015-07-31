## 概要

* 筑波大enPiTでrailsアプリを作る人の用の開発環境を自動作成するVagrantファイルです。
* 産技大enPiTのレポジトリ [github:ychubachi/vagrant_enpit](https://github.com/ychubachi/vagrant_enpit) を元に作っています。
 * vm.boxにubuntu/trusty64 を使っているのが異なるところです
  * cloudstack on idcf cloud へ同じ環境をデプロイすることを想定
 * forkしてないのは実は一から作り直したから…

## 準備

- Vagrant
- VirtualBox
- Chef DK

## Vagrantのプラグイン
VagrantにChef，Berkshelfのプラグインを入れる．

```bash
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
```

## 起動

レシピのインストール．

```bash
berks install
```

起動する．

```bash
vagrant up
```

## Chefで取りこぼしたソフトウエアのインストール

hubと，rbenvへのGemのインストールがChefでうまくいかないので，
スクリプトを実行する．

```bash
vagrant ssh --command /vagrant/extra_provision.sh
```





