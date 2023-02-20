# ODP

## 実装戦略
- ミスゼロ子の親機に導入する
  - バーコードリーダーがデフォルトで使用できるため、これを入力インターフェースとして使用する。
- 実装はFlutterにて行う。（Flutter Winddows Desktop）
- キーボードを使用するのが難しいので、タッチ操作可能なUIを実装する
- また、画面サイズが非常に小さいので、それに対応したUIを実装する

## フローチャート
### 集薬時
集薬が終わった時に、ODPリストに薬を登録する目的で行うフロー。
‐ 患者番号が手入力できる
- 患者番号をバーコード入力できる
- 患者番号が存在しないとき、患者登録できる
- 登録時に薬リストの確認ができる
- 登録時に薬リストを編集できる
- 登録完了できる
```mermaid
flowchart TD
集約時 -- バーコード --> 患者番号入力
集約時 -- 手入力 --> 患者番号入力
患者番号入力 --> 患者番号検索
患者番号検索 -- 患者がいない --> 患者登録
患者登録 --> 薬リストの確認
患者番号検索 -- 患者が存在 --> 患者があっているか確認
患者があっているか確認 -- 合致 --> 薬リストの確認
患者があっているか確認 -- 合致しない --> 患者番号入力
患者があっているか確認 -- 合致しない --> 患者登録
薬リストの確認 -- 薬が変更になっている --> 薬リストの編集
薬リストの確認 -- 薬の変更なし --> 薬リストの登録
薬リストの編集 -- 薬マスタに存在しない --> 薬マスタに追加
薬リストの編集 --> 薬リストの登録
```

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
 - 患者ID or 患者名 → 患者の薬リストを提供する  
 - 薬品名 → 集薬している量と、患者リストを提供する

### 一括処理
 - 一括でisCollectをfalseにする
 - 一括でバーコードを印刷する
 - 一括で更新されていない患者を削除する
 
```mermaid
flowchart TD
患者ID/名前か薬を選択 -- 患者 --> 患者検索
患者検索 --> IdOrName{{数字か文字で判定}}
IdOrName --> 患者リストを提示
患者ID/名前か薬を選択 -- 薬 --> 薬検索
薬検索 --> 集薬量と患者名リストを提供
```

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
    }

```
**Patient（id）**　→ MedCollection(patientId)であり、**Patient（patientId)はリレーションに使用しない。**
