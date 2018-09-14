# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  band_id    :string           not null
#  year       :integer          not null
#  album_type :string           not null
#

class Album < ApplicationRecord
  ALBUM_TYPES = %w(live studio)

  validates :title, :band_id, :year, :album_type, presence:true
  validates :album_type, inclusion: ALBUM_TYPES

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    foreign_key: :album_id,
    class_name: :Track

  def album_types
    ALBUM_TYPES
  end
end
