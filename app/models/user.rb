class User < ApplicationRecord
    
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/images/default_avatar.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  attr_accessor :processors
    
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_many :follows

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  
  validates :name, presence: true, length: {maximum: 50}
  validates :image, presence: true
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image.gsub!("_normal", "") # assuming the user model has an image
      user.uid = auth.uid
      user.provider = auth.provider
      user.username = auth.info.name.gsub(" ", "")
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      nil
    end
  end
  
  acts_as_followable
  acts_as_follower
end
