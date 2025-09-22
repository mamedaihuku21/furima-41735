class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true

  #カタカナ
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
  #名前
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  
  validate :password_complexity
  
  private

  def password_complexity
    return if password.blank? # Deviseがpresenceとlengthチェック済み

    unless password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)
      errors.add(:password, "は半角英数字混合で入力してください")
    end
  end
end
