10.times do |n|
  User.create!(
    name: "user#{n+1}",
    email: "user#{n+1}@test.com",
    password: 'password',
    age: rand(2..11),
    prefecture: rand(1..47),
    self_introduction: "ユーザー#{n+1}です。",
    classification: rand(1..10),
    birthday: Faker::Date.birthday(max_age: 90),
    admin: false
  )
end

User.create!(
  name: 'ゲスト管理者',
  email: 'admin@test.com',
  password: 'admin01',
  age: '30代',
  prefecture: '東京都',
  self_introduction: 'ゲスト管理者です。',
  classification: '本人',
  birthday: Faker::Date.birthday(max_age: 90),
  admin: true,
  image:File.open("app/assets/images/test_image_1.png")
)

Disease.create!([
  {name: '球脊髄性筋萎縮症', number: '1'},
  {name: '筋萎縮性側索硬化症', number: '2'},
  {name: '脊髄性筋萎縮症', number: '3'},
  {name: '原発性側索硬化症', number: '4',},
  {name: '進行性核上性麻痺', number: '5',},
  {name: 'パーキンソン病', number: '6',},
  {name: '大脳皮質基底核変性症', number: '7'},
  {name: 'ハンチントン病', number: '8'},
  {name: '神経有棘赤血球症', number: '9'},
  {name: 'シャルコー・マリー・トゥース病', number: '10'},
  {name: '重症筋無力症', number: '11'},
  {name: '先天性筋無力症候群', number: '12'},
  {name: '多発性硬化症／視神経脊髄炎', number: '13'},
  {name: '慢性炎症性脱髄性多発神経炎／多巣性運動ニューロパチー', number: '14'},
  {name: '封入体筋炎', number: '15'},
  {name: 'クロウ・深瀬症候群', number: '16'},
  {name: '多系統萎縮症', number: '17'},
  {name: '脊髄小脳変性症(多系統萎縮症を除く。)', number: '18'},
  {name: 'ライソゾーム病', number: '19'},
  {name: '副腎白質ジストロフィー', number: '20'},
  {name: 'ミトコンドリア病', number: '21'},
  {name: 'もやもや病', number: '22'},
  {name: 'プリオン病', number: '23'},
  {name: '亜急性硬化性全脳炎', number: '24'},
  {name: '進行性多巣性白質脳症', number: '25'},
  {name: 'HTLV-1関連脊髄症', number: '26'},
  {name: '特発性基底核石灰化症', number: '27'},
  {name: '全身性アミロイドーシス', number: '28'},
  {name: 'ウルリッヒ病', number: '29'},
  {name: '遠位型ミオパチー', number: '30'},
  {name: 'ベスレムミオパチー', number: '31'},
  {name: '自己貪食空胞性ミオパチー', number: '32'},
  {name: 'シュワルツ・ヤンペル症候群', number: '33'},
  {name: '神経線維腫症', number: '34'},
  {name: '天疱瘡', number: '35'},
  {name: '表皮水疱症', number: '36'},
  {name: '膿疱性乾癬（汎発型）', number: '37'},
  {name: 'スティーヴンス・ジョンソン症候群', number: '38'},
  {name: '中毒性表皮壊死症', number: '39'},
  {name: '高安動脈炎', number: '40'},
  {name: '巨細胞性動脈炎', number: '41'},
  {name: '結節性多発動脈炎', number: '42'},
  {name: '顕微鏡的多発血管炎', number: '43'},
  {name: '多発血管炎性肉芽腫症', number: '44'},
  {name: '好酸球性多発血管炎性肉芽腫症', number: '45'},
  {name: '悪性関節リウマチ', number: '46'},
  {name: 'バージャー病', number: '47'},
  {name: '原発性抗リン脂質抗体症候群', number: '48'},
  {name: '全身性エリテマトーデス', number: '49'},
  {name: '皮膚筋炎／多発性筋炎', number: '50'},
  {name: '全身性強皮症', number: '51'},
  {name: '混合性結合組織病', number: '52'},
  {name: 'シェーグレン症候群', number: '53'},
  {name: '成人スチル病', number: '54'},
  {name: '再発性多発軟骨炎', number: '55'},
  {name: 'ベーチェット病', number: '56'},
  {name: '特発性拡張型心筋症', number: '57'},
  {name: '肥大型心筋症', number: '58'},
  {name: '拘束型心筋症', number: '59'},
  {name: '再生不良性貧血', number: '60'},
  {name: '自己免疫性溶血性貧血', number: '61'},
  {name: '発作性夜間ヘモグロビン尿症', number: '62'},
  {name: '特発性血小板減少性紫斑病', number: '63'},
  {name: '血栓性血小板減少性紫斑病', number: '64'},
  {name: '原発性免疫不全症候群', number: '65'},
  {name: 'IgＡ 腎症', number: '66'},
  {name: '多発性嚢胞腎', number: '67'},
  {name: '黄色靱帯骨化症', number: '68'},
  {name: '後縦靱帯骨化症', number: '69'},
  {name: '広範脊柱管狭窄症', number: '70'},
  {name: '特発性大腿骨頭壊死症', number: '71'},
  {name: '下垂体性ADH分泌異常症', number: '72'},
  {name: '下垂体性TSH分泌亢進症', number: '73'},
  {name: '下垂体性PRL分泌亢進症', number: '74'},
  {name: 'クッシング病', number: '75'},
  {name: '下垂体性ゴナドトロピン分泌亢進症', number: '76'},
  {name: '下垂体性成長ホルモン分泌亢進症', number: '77'},
  {name: '下垂体前葉機能低下症', number: '78'},
  {name: '家族性高コレステロール血症（ホモ接合体）', number: '79'},
  {name: '甲状腺ホルモン不応症', number: '80'},
  {name: '先天性副腎皮質酵素欠損症', number: '81'},
  {name: '先天性副腎低形成症', number: '82'},
  {name: 'アジソン病', number: '83'},
  {name: 'サルコイドーシス', number: '84'},
  {name: '特発性間質性肺炎', number: '85'},
  {name: '肺動脈性肺高血圧症', number: '86'},
  {name: '肺静脈閉塞症／肺毛細血管腫症', number: '87'},
  {name: '慢性血栓塞栓性肺高血圧症', number: '88'},
  {name: 'リンパ脈管筋腫症', number: '89'},
  {name: '網膜色素変性症', number: '90'},
  {name: 'バッド・キアリ症候群', number: '91'},
  {name: '特発性門脈圧亢進症', number: '92'},
  {name: '原発性胆汁性胆管炎', number: '93'},
  {name: '原発性硬化性胆管炎', number: '94'},
  {name: '自己免疫性肝炎', number: '95'},
  {name: 'クローン病', number: '96'},
  {name: '潰瘍性大腸炎', number: '97'},
  {name: '好酸球性消化管疾患', number: '98'},
  {name: '慢性特発性偽性腸閉塞症', number: '99'},
  {name: '巨大膀胱短小結腸腸管蠕動不全症', number: '100'},
  {name: '腸管神経節細胞僅少症', number: '101'},
  {name: 'ルビンシュタイン・テイビ症候群', number: '102'},
  {name: 'CFC症候群', number: '103'},
  {name: 'コステロ症候群', number: '104'},
  {name: 'チャージ症候群', number: '105'},
  {name: 'クリオピリン関連周期熱症候群', number: '106'},
  {name: '若年性特発性関節炎', number: '107'},
  {name: 'TNF受容体関連周期性症候群', number: '108'},
  {name: '非典型溶血性尿毒症症候群', number: '109'},
  {name: 'ブラウ症候群', number: '110'},
  {name: '先天性ミオパチー', number: '111'},
  {name: 'マリネスコ・シェーグレン症候群', number: '112'},
  {name: '筋ジストロフィー', number: '113'},
  {name: '非ジストロフィー性ミオトニー症候群', number: '114'},
  {name: '遺伝性周期性四肢麻痺', number: '115'},
  {name: 'アトピー性脊髄炎', number: '116'},
  {name: '脊髄空洞症', number: '117'},
  {name: '脊髄髄膜瘤', number: '118'},
  {name: 'アイザックス症候群', number: '119'},
  {name: '遺伝性ジストニア', number: '120'},
  {name: '神経フェリチン症', number: '121'},
  {name: '脳表ヘモジデリン沈着症', number: '122'},
  {name: '禿頭と変形性脊椎症を伴う常染色体劣性白質脳症', number: '123'},
  {name: '皮質下梗塞と白質脳症を伴う常染色体優性脳動脈症', number: '124'},
  {name: '神経軸索スフェロイド形成を伴う遺伝性びまん性白質脳症', number: '125'},
  {name: 'ペリー症候群', number: '126'},
  {name: '前頭側頭葉変性症', number: '127'},
  {name: 'ビッカースタッフ脳幹脳炎', number: '128'},
  {name: '痙攣重積型（二相性）急性脳症', number: '129'},
  {name: '先天性無痛無汗症', number: '130'},
  {name: 'アレキサンダー病', number: '131'},
  {name: '先天性核上性球麻痺', number: '132'},
  {name: 'メビウス症候群', number: '133'},
  {name: '中隔視神経形成異常症/ドモルシア症候群', number: '134'},
  {name: 'アイカルディ症候群', number: '135'},
  {name: '片側巨脳症', number: '136'},
  {name: '限局性皮質異形成', number: '137'},
  {name: '神経細胞移動異常症', number: '138'},
  {name: '先天性大脳白質形成不全症', number: '139'},
  {name: 'ドラベ症候群', number: '140'},
  {name: '海馬硬化を伴う内側側頭葉てんかん', number: '141'},
  {name: 'ミオクロニー欠神てんかん', number: '142'},
  {name: 'ミオクロニー脱力発作を伴うてんかん', number: '143'},
  {name: 'レノックス・ガストー症候群', number: '144'},
  {name: 'ウエスト症候群', number: '145'},
  {name: '大田原症候群', number: '146'},
  {name: '早期ミオクロニー脳症', number: '147'},
  {name: '遊走性焦点発作を伴う乳児てんかん', number: '148'},
  {name: '片側痙攣・片麻痺・てんかん症候群', number: '149'},
  {name: '環状20番染色体症候群', number: '150'},
  {name: 'ラスムッセン脳炎', number: '151'},
  {name: 'ＰＣＤＨ19関連症候群', number: '152'},
  {name: '難治頻回部分発作重積型急性脳炎', number: '153'},
  {name: '徐波睡眠期持続性棘徐波を示すてんかん性脳症', number: '154'},
  {name: 'ランドウ・クレフナー症候群', number: '155'},
  {name: 'レット症候群', number: '156'},
  {name: 'スタージ・ウェーバー症候群', number: '157'},
  {name: '結節性硬化症', number: '158'},
  {name: '色素性乾皮症', number: '159'},
  {name: '先天性魚鱗癬', number: '160'},
  {name: '家族性良性慢性天疱瘡', number: '161'},
  {name: '類天疱瘡（後天性表皮水疱症を含む。）', number: '162'},
  {name: '特発性後天性全身性無汗症', number: '163'},
  {name: '眼皮膚白皮症', number: '164'},
  {name: '肥厚性皮膚骨膜症', number: '165'},
  {name: '弾性線維性仮性黄色腫', number: '166'},
  {name: 'マルファン症候群', number: '167'},
  {name: 'エーラス・ダンロス症候群', number: '168'},
  {name: 'メンケス病', number: '169'},
  {name: 'オクシピタル・ホーン症候群', number: '170'},
  {name: 'ウィルソン病', number: '171'},
  {name: '低ホスファターゼ症', number: '172'},
  {name: 'VATER症候群', number: '173'},
  {name: '那須・ハコラ病', number: '174'},
  {name: 'ウィーバー症候群', number: '175'},
  {name: 'コフィン・ローリー症候群', number: '176'},
  {name: 'ジュベール症候群関連疾患', number: '177'},
  {name: 'モワット・ウィルソン症候群', number: '178'},
  {name: 'ウィリアムズ症候群', number: '179'},
  {name: 'ＡＴＲ－Ｘ症候群', number: '180'},
  {name: 'クルーゾン症候群', number: '181'},
  {name: 'アペール症候群', number: '182'},
  {name: 'ファイファー症候群', number: '183'},
  {name: 'アントレー・ビクスラー症候群', number: '184'},
  {name: 'コフィン・シリス症候群', number: '185'},
  {name: 'ロスムンド・トムソン症候群', number: '186'},
  {name: '歌舞伎症候群', number: '187'},
  {name: '多脾症候群', number: '188'},
  {name: '無脾症候群', number: '189'},
  {name: '鰓耳腎症候群', number: '190'},
  {name: 'ウェルナー症候群', number: '191'},
  {name: 'コケイン症候群', number: '192'},
  {name: 'プラダー・ウィリ症候群', number: '193'},
  {name: 'ソトス症候群', number: '194'},
  {name: 'ヌーナン症候群', number: '195'},
  {name: 'ヤング・シンプソン症候群', number: '196'},
  {name: '１p36欠失症候群', number: '197'},
  {name: '４p欠失症候群', number: '198'},
  {name: '５p欠失症候群', number: '199'},
  {name: '第14番染色体父親性ダイソミー症候群', number: '200'},
  {name: 'アンジェルマン症候群', number: '201'},
  {name: 'スミス・マギニス症候群', number: '202'},
  {name: '22q11.2欠失症候群', number: '203'},
  {name: 'エマヌエル症候群', number: '204'},
  {name: '脆弱Ｘ症候群関連疾患', number: '205'},
  {name: '脆弱X症候群', number: '206'},
  {name: '総動脈幹遺残症', number: '207'},
  {name: '修正大血管転位症', number: '208'},
  {name: '完全大血管転位症', number: '209'},
  {name: '単心室症', number: '210'},
  {name: '左心低形成症候群', number: '211'},
  {name: '一次性ネフローゼ症候群', number: '222'},
  {name: '一次性膜性増殖性糸球体腎炎', number: '223'},
  {name: '紫斑病性腎炎', number: '224'},
  {name: '先天性腎性尿崩症', number: '225'},
  {name: '間質性膀胱炎（ハンナ型）', number: '226'},
  {name: 'オスラー病', number: '227'},
  {name: '閉塞性細気管支炎', number: '228'},
  {name: '肺胞蛋白症（自己免疫性又は先天性）', number: '229'},
  {name: '肺胞低換気症候群', number: '230'},
  {name: 'α1－アンチトリプシン欠乏症', number: '231'},
  {name: 'カーニー複合', number: '232'},
  {name: 'ウォルフラム症候群', number: '233'},
  {name: 'ペルオキシソーム病（副腎白質ジストロフィーを除く。）', number: '234'},
  {name: '副甲状腺機能低下症', number: '235'},
  {name: '偽性副甲状腺機能低下症', number: '236'},
  {name: '副腎皮質刺激ホルモン不応症', number: '237'},
  {name: 'ビタミンＤ抵抗性くる病/骨軟化症', number: '238'},
  {name: 'ビタミンＤ依存性くる病/骨軟化症', number: '239'},
  {name: 'フェニルケトン尿症', number: '240'},
  {name: '高チロシン血症1型', number: '241'},
  {name: '高チロシン血症2型', number: '242'},
  {name: '高チロシン血症3型', number: '243'},
  {name: 'メープルシロップ尿症', number: '244'},
  {name: 'プロピオン酸血症', number: '245'},
  {name: 'メチルマロン酸血症', number: '246'},
  {name: 'イソ吉草酸血症', number: '247'},
  {name: 'グルコーストランスポーター1欠損症', number: '248'},
  {name: 'グルタル酸血症1型', number: '249'},
  {name: 'グルタル酸血症2型', number: '250'},
  {name: '尿素サイクル異常症', number: '251'},
  {name: 'リジン尿性蛋白不耐症', number: '252'},
  {name: '先天性葉酸吸収不全', number: '253'},
  {name: 'ポルフィリン症', number: '254'},
  {name: '複合カルボキシラーゼ欠損症', number: '255'},
  {name: '筋型糖原病', number: '256'},
  {name: '肝型糖原病', number: '257'},
  {name: 'ガラクトース－１－リン酸ウリジルトランスフェラーゼ欠損症', number: '258'},
  {name: 'レシチンコレステロールアシルトランスフェラーゼ欠損症', number: '259'},
  {name: 'シトステロール血症', number: '260'},
  {name: 'タンジール病', number: '261'},
  {name: '原発性高カイロミクロン血症', number: '262'},
  {name: '脳腱黄色腫症', number: '263'},
  {name: '無βリポタンパク血症', number: '264'},
  {name: '脂肪萎縮症', number: '265'},
  {name: '家族性地中海熱', number: '266'},
  {name: '高ＩｇＤ症候群', number: '267'},
  {name: '中條・西村症候群', number: '268'},
  {name: '化膿性無菌性関節炎・壊疽性膿皮症・アクネ症候群', number: '269'},
  {name: '慢性再発性多発性骨髄炎', number: '270'},
  {name: '強直性脊椎炎', number: '271'},
  {name: '進行性骨化性線維異形成症', number: '272'},
  {name: '肋骨異常を伴う先天性側弯症', number: '273'},
  {name: '骨形成不全症', number: '274'},
  {name: 'タナトフォリック骨異形成症', number: '275'},
  {name: '軟骨無形成症', number: '276'},
  {name: 'リンパ管腫症/ゴーハム病', number: '277'},
  {name: '巨大リンパ管奇形（頚部顔面病変）', number: '278'},
  {name: '巨大静脈奇形（頚部口腔咽頭びまん性病変）', number: '279'},
  {name: '巨大動静脈奇形（頚部顔面又は四肢病変）', number: '280'},
  {name: 'クリッペル・トレノネー・ウェーバー症候群', number: '281'},
  {name: '先天性赤血球形成異常性貧血', number: '282'},
  {name: '後天性赤芽球癆', number: '283'},
  {name: 'ダイアモンド・ブラックファン貧血', number: '284'},
  {name: 'ファンコニ貧血', number: '285'},
  {name: '遺伝性鉄芽球性貧血', number: '286'},
  {name: 'エプスタイン症候群', number: '287'},
  {name: '自己免疫性後天性凝固因子欠乏症', number: '288'},
  {name: 'クロンカイト・カナダ症候群', number: '289'},
  {name: '非特異性多発性小腸潰瘍症', number: '290'},
  {name: 'ヒルシュスプルング病（全結腸型又は小腸型）', number: '291'},
  {name: '総排泄腔外反症', number: '292'},
  {name: '総排泄腔遺残', number: '293'},
  {name: '先天性横隔膜ヘルニア', number: '294'},
  {name: '乳幼児肝巨大血管腫', number: '295'},
  {name: '胆道閉鎖症', number: '296'},
  {name: 'アラジール症候群', number: '297'},
  {name: '遺伝性膵炎', number: '298'},
  {name: '嚢胞性線維症', number: '299'},
  {name: 'ＩｇＧ４関連疾患', number: '300'},
  {name: '黄斑ジストロフィー', number: '301'},
  {name: 'レーベル遺伝性視神経症', number: '302'},
  {name: 'アッシャー症候群', number: '303'},
  {name: '若年発症型両側性感音難聴', number: '304'},
  {name: '遅発性内リンパ水腫', number: '305'},
  {name: '好酸球性副鼻腔炎', number: '306'},
  {name: 'カナバン病', number: '307'},
  {name: '進行性白質脳症', number: '308'},
  {name: '進行性ミオクローヌスてんかん', number: '309'},
  {name: '先天異常症候群', number: '310'},
  {name: '先天性三尖弁狭窄症', number: '311'},
  {name: '先天性僧帽弁狭窄症', number: '312'},
  {name: '先天性肺静脈狭窄症', number: '313'},
  {name: '左肺動脈右肺動脈起始症', number: '314'},
  {name: 'ネイルパテラ症候群（爪膝蓋骨症候群）／ＬＭＸ１Ｂ関連腎症', number: '315'},
  {name: 'カルニチン回路異常症', number: '316'},
  {name: '三頭酵素欠損症', number: '317'},
  {name: 'シトリン欠損症', number: '318'},
  {name: 'セピアプテリン還元酵素（ＳＲ）欠損症', number: '319'},
  {name: '先天性グリコシルホスファチジルイノシトール（GPI）欠損症', number: '320'},
  {name: '非ケトーシス型高グリシン血症', number: '321'},
  {name: 'β―ケトチオラーゼ欠損症', number: '322'},
  {name: '芳香族L－アミノ酸脱炭酸酵素欠損症', number: '323'},
  {name: 'メチルグルタコン酸尿症', number: '324'},
  {name: '遺伝性自己炎症疾患', number: '325'},
  {name: '大理石骨病', number: '326'},
  {name: '特発性血栓症（遺伝性血栓性素因によるものに限る。）', number: '327'},
  {name: '前眼部形成異常', number: '328'},
  {name: '無虹彩症', number: '329'},
  {name: '先天性気管狭窄症／先天性声門下狭窄症', number: '330'},
  {name: '特発性多中心性キャッスルマン病', number: '331'},
  {name: '膠様滴状角膜ジストロフィー', number: '332'},
  {name: 'ハッチンソン・ギルフォード症候群', number: '333'},
  {name: '脳クレアチン欠乏症候群', number: '334'},
  {name: 'ネフロン癆', number: '335'},
  {name: '家族性低βリポタンパク血症１（ホモ接合体）', number: '336'},
  {name: 'ホモシスチン尿症', number: '337'},
  {name: '進行性家族性肝内胆汁うっ滞症', number: '338'}
])

5.times do 
  Expense.create!(
    treatment_cost: 100000,
    drug_cost: 80000,
    other_cost: 40000,
    disease_id: rand(1..5),
    user_id: rand(1..11)
  )
  end
  
5.times do 
  Expense.create!(
    treatment_cost: 70000,
    drug_cost: 50000,
    other_cost: 30000,
    disease_id: rand(1..5),
    user_id: rand(1..11),
  )
  end

10.times do 
Treatment.create!(
  affected_on: Faker::Date.between(from: 50.days.ago, to: Date.today),
  drug_name: Faker::Science.modifier,
  content: Faker::Quote.jack_handey,
  advice: Faker::Quotes::Shakespeare.as_you_like_it_quote,
  disease_id: rand(1..5),
  user_id: rand(1..11)
)
end

10.times do
Comment.create!(
  disease_id: rand(1..5),
  content: Faker::Quote.singular_siegler,
  user_id: rand(1..11),
)
end

10.times do
Onset.create!(
  disease_id: rand(1..5),
  user_id: rand(1..11),
)
end