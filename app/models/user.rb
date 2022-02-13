class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :onsets, dependent: :destroy
  has_many :onset_diseases, through: :onsets, source: :disease
  #has_many :onset_diseases, through: :onsets, source: :disease

  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      # user.name = "ゲスト" なども必要
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.admin = true
      # user.name = "ゲスト" なども必要
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
end
