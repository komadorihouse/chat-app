class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  #unless: :was_attached?で条件分岐させている。

  def was_attached?
    self.image.attached?
  #画像が存在しなければテキストが必要となり、画像があればテキストは不要になる
  end
end