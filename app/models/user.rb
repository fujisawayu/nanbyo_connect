class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :onsets, dependent: :destroy
  has_many :onset_diseases, through: :onsets, source: :disease
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { in: 1..10 }
  validates :self_introduction, length: { in: 1..1000 }

  enum prefecture:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }
  validates :prefecture, inclusion: { in: User.prefectures.keys[1..47] }

  enum age:{
    "-----":1,
    "10歳未満":2,"10代":3,"20代":4,"30代":5,"40代":6,"50代":7,"60代":8,"70代":9,"80代":10,"90代以上":11
  }
  validates :age, inclusion: { in: User.ages.keys[1..11] }

  enum classification:{
    "----":0,
    本人:1,家族:2,親戚:3,友人:4,恋人:5,患者団体:6,医師:7,薬剤師:8,看護師:9,その他医療従事者:10
  }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.admin = false
      user.name = "ゲスト"
      user.age = "30代"
      user.birthday = "2022-02-22"
      user.prefecture = "東京都"
      user.self_introduction =  "ゲストです。"
      user.classification =  "本人"

    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.admin = true
      user.name = "ゲスト管理者"
      user.age = "30代"
      user.birthday = "2022-01-01"
      user.prefecture = "東京都"
      user.self_introduction =  "ゲスト管理者です。"
      user.classification =  "本人"
    end
  end

  def onset(disease)
    onsets_diseases << disease
  end

  def unonset(disease)
    onsets_diseases.destroy(disease)
  end
  
  # お気に入りしているかどうか
  def onsets?(disease)
    onsets.where(disease_id: :disease.id).exists?
  end

  #指定のユーザをフォローする
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  
  #指定のユーザのフォローを解除する
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
