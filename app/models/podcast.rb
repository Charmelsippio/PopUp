class Podcast < ActiveRecord::Base
  belongs_to :admin
  has_many :resources

  # show audio
  has_attached_file :audio
  # :path => ":rails_root/public/system/audios/000"
  validates_attachment_presence :audio
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
                                    # :message => 'file must be of filetype .mp3'

  validates_attachment_size :audio, :less_than => 50.megabytes                                    
  validates_presence_of :title

end
