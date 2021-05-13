class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
  validates :name, presence: true
  #deviseで設定されていないnameはヴァリテーションを自分で設置する必要がある

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
end