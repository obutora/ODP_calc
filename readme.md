# ODP

## 実装戦略
- ミスゼロ子の親機に導入する
  - バーコードリーダーがデフォルトで使用できるため、これを入力インターフェースとして使用する。
- 実装はFlutterにて行う。（Flutter Winddows Desktop）
- キーボードを使用するのが難しいので、タッチ操作可能なUIを実装する
- また、画面サイズが非常に小さいので、それに対応したUIを実装する

## フローチャート
### 集薬
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
薬リストの編集 --> 薬リストの登録
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
    }

```
**Patient（id）**　→ MedCollection(patientId)であり、**Patient（patientId)はリレーションに使用しない。**
