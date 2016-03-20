class Vote < ActiveRecord::Base
  belongs_to :verse
  belongs_to :topic
  belongs_to :verse_end, class_name: 'Verse'
end
