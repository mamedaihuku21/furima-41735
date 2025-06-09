class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email,    presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は@を含む正しい形式で入力してください" }
  
  validate :password_complexity
  
  private

  def password_complexity
    return if password.blank? # Deviseがpresenceとlengthチェック済み

    unless password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)
      errors.add(:password, "は半角英数字混合で入力してください")
    end
  end
end
