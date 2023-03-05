# ODP

## 実装戦略
- ミスゼロ子の親機に導入する
  - バーコードリーダーがデフォルトで使用できるため、これを入力インターフェースとして使用する。
- 実装はFlutterにて行う。（Flutter Winddows Desktop）
- キーボードを使用するのが難しいので、タッチ操作可能なUIを実装する
- また、画面サイズが非常に小さいので、それに対応したUIを実装する

## 実装要件
### 集薬時
‐ 患者番号が手入力できる
- 患者番号をバーコード入力できる
- 患者番号が存在しないとき、患者登録できる
- 登録時に薬リストの確認ができる
- 登録時に薬リストを編集できる
- 登録完了できる
### 処方時
‐ 患者番号が手入力できる
- 患者番号をバーコード入力できる
- 患者番号からMedCollectionsを取り出してチェックできる
- 取り出したMedCollectionsを一括でisCollectedに変更できる

## UI設計
Figmaにて
https://www.figma.com/file/F7D6iuZsaUs7S1mYJKJRGp/ODP%E5%9C%A8%E5%BA%AB%E7%AE%A1%E7%90%86%E3%82%A2%E3%83%97%E3%83%AA?node-id=0%3A1&t=3qeMwRsSepiNHmRF-0

## フローチャート
### 処方時
処方が出た後に、ODPリストから薬を削除する目的で行うフロー
```mermaid
flowchart TD
処方時 -- バーコード --> 患者番号入力
処方時 -- 手入力 --> 患者番号入力
患者番号入力 --> check{{患者が正しいか内部チェック}}
check -- 合致 --> 薬リストの確認
check -- 合致しない --> 患者番号入力
薬リストの確認 --> toFalse{{薬リストをisCollectedをfalseに}}
```

### 検索時
```mermaid
flowchart TD
検索ボタン -- int --> バーコードと判定
バーコードと判定 --> 集薬確認画面に遷移
検索ボタン --> ラジオボタンの判定
ラジオボタンの判定 -- 患者名で検索 --> 集薬確認画面に遷移
ラジオボタンの判定 -- 薬品名で検索 --> 患者リスト確認画面に推移
```

### 検索ワード判定フロー
```mermaid
flowchart TD
検索ワード --> int
検索ワード --> string
int -- 16桁 --> gs1[医薬品GS-1]
gs1 --> gs1でMedCollectionを検索 --> MedPickCollection
int -- x桁 --> 患者ID
患者ID --> 患者IDでMedCollectionを検索
string --> radio{{患者or薬判定用ラジオボタン}}
radio --> 患者名でMedCollectionを検索
radio --> 薬名でMedCollectionを検索 --> MedPickCollection

```
 - ^[\u4E00-\u9FFF]+$
   - 👆 で漢字のみを抽出できるが、名前と医薬品の判定は不可能と判断
   - カタカナ含む患者名と、漢方を区別できないため。
 
 ### 検索
```mermaid
flowchart TD
患者ID/名前か薬を選択 -- 患者 --> 患者検索
患者検索 --> IdOrName{{数字か文字で判定}}
IdOrName --> 患者リストを提示
患者ID/名前か薬を選択 -- 薬 --> 薬検索
薬検索 --> 集薬量と患者名リストを提供
```

### 一括処理
 - 一括でisCollectをfalseにする
 - 一括でバーコードを印刷する
 - 一括で更新されていない患者を削除する
 
 
### マスタ編集
患者マスタ、薬マスタを編集する
```mermaid
flowchart TD
マスタ編集 --> 患者編集
マスタ編集 --> 薬編集
```


### Entity
```mermaid
erDiagram

MedMaster }|--|{ MedCollection : ""
Patient }|--|| MedCollection : ""

    Patient {
        int id PK
        int patientId
        string name
        string katakana
    }

    MedCollection {
        int id PK
        int patientId
        int medMasterId
        int amount
        bool isCollected
        date updateAt
    }

    MedMaster {
        int id PK
        string name
        string unit
        List-String gs1CodeList
        bool isUsing
    }

```
**Patient（id）**　→ MedCollection(patientId)であり、**Patient（patientId)はリレーションに使用しない。**

### 備忘録
当初、店舗内ネットワークでAPIサーバーを公開し、店舗内のすべてのPCでシステムを利用したいと考えていた。  
APIサーバーをデプロイするPCのスペックは低かった為、なるべくメモリ使用量が少なく、レスポンスも早いものが良かったのでRust製APIを作成しようと試みた。  
しかし、バーコードリーダーはサーバー機くらいしか配備されておらず、患者登録の手間と天秤にかけた時、店舗内PCすべてで利用する価値よりもバーコードリーダーの利用価値の方が高いと判断した。  
したがって、APIサーバーの実装は不要と決定。  
プロジェクト内にRust製APIの初期実装が残っているのはその名残。
