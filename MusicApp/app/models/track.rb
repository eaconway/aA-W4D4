# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  album_id   :integer          not null
#  track_type :string           not null
#

class Track < ApplicationRecord
  TRACK_TYPES = %w(regular bonus)

  validates :title, :ord, :album_id, :track_type, presence: true
  validates :track_type, inclusion: TRACK_TYPES

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album

end
