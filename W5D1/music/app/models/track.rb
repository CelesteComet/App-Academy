# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  ord        :string           not null
#  band_id    :integer          not null
#  album_id   :integer          not null
#  lyrics     :string           not null
#  regular    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, :band_id, :album_id

  belongs_to :band
  belongs_to :album

   
end
