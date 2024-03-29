# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  phone                  :string           default("")
#  age                    :integer
#  provider               :string           default("")
#  uid                    :string           default("")
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  first_name             :string
#  last_name              :string
#

class User < ApplicationRecord
  include Paperclip::Glue

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable, omniauth_providers: %i[facebook twitter]

  has_many :initiatives, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy

  validates :first_name, :last_name, :email, :phone, :age, presence: true
  validates :first_name, :last_name, length: { in: 2..20 }
  validates :phone, phone: true

  size_user_avatars = { medium: '300x300>', thumb: '100x100>' }

  has_attached_file :avatar,
                    styles: size_user_avatars,
                    default_url: '/images/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

  def self.from_omniauth(auth)
    user_password = Passgen.generate
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email unless auth.info.email.nil?
      user.password = user_password
      user.skip_confirmation!
      UserMailer.send_password_to_user(user, user_password).deliver_now! unless auth.info.email.nil?
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end
