class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  #attr_accessible :provider, :uid, :name

  has_one :wallet
  has_many :location_ownerships
  has_many :locations, :through=>:location_ownerships

  after_create do |record|
    Wallet.create!(:user=>record, :total=>50000)
  end



  def serializable_hash(options = nil)
    super(options).merge({:img_url=>"https://secure.gravatar.com/avatar/"+Digest::MD5.hexdigest(email)+"?d=identicon"})
  end



  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end
end
