class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :address, dependent: :destroy
  has_one :phone_number, dependent: :destroy
  has_one :creditcard, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phone_number
  accepts_nested_attributes_for :creditcard
  has_many :sns_credentials
  has_many :comments


#REGEX and Validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  KANA_REGEX = /\A([ァ-ン]|ー)+\z/i
  NAME_REGEX = /\A([ぁ-んァ-ヶー一-龠])+\z/i
  validates :email,             presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,          presence: true, length: {minimum: 7, maximum: 128}, format: { with: PASSWORD_REGEX  }
  validates :nickname,          presence: true
  validates :last_name,         presence: true, length: {maximum: 20}, format: { with: NAME_REGEX }
  validates :first_name,        presence: true, length: {maximum: 20}, format: { with: NAME_REGEX }
  validates :last_name_kana,    presence: true, length: {maximum: 20}, format: { with: KANA_REGEX }
  validates :first_name_kana,   presence: true, length: {maximum: 20}, format: { with: KANA_REGEX }
  validates :birth_year,        presence: true
  validates :birth_month,       presence: true
  validates :birth_day,         presence: true
  
#SNS authentication
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
