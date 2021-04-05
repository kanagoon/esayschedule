class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :dones, dependent: :destroy
  has_many :doned_posts, through: :dones, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_doned?(post)
    self.dones.exists?(post_id: post.id)
  end

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

end