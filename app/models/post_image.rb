class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # PostComment modelに関連付け
  has_many :post_comments, dependent: :destroy
  # いいね機能
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
     image
  end
    # if image.attached?
      # iamge
    # else
      # 'no_image.jpg'
    # end

end
