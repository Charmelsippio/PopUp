class Resource < ActiveRecord::Base
  belongs_to :podcast

  has_attached_file :document
  validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png image/gif application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates_presence_of :title

  def self.nokogiri_data(publication)
    resource = self.find(publication)

    if publication == 1
      self.parser_wapo(resource)
    elsif publication == 3
      self.parser_nytimes(resource)
    elsif publication == 8
      self.parser_atlantic(resource)
    elsif publication == 5
      self.parser_aljazeera(resource)
    elsif publication == 6
      self.parser_npr(resource)
    end #end if statement
  end #end def

  private

  def self.parser_wapo(resource)
    site = Nokogiri::HTML(open(resource.link))
    
    OpenStruct.new({
      title: site.css("h1").text,
      resource: resource,
      content: site.css("article").text
    })
  end

  def self.parser_nytimes(resource)
    site = Nokogiri::HTML(open(resource.link))

    OpenStruct.new({
      title: site.css("h1").text,
      resource: resource,
      content: site.css(".story-body-text .story-content").text
    })
  end

  def self.parser_atlantic(resource)
    site = Nokogiri::HTML(open(resource.link))

    OpenStruct.new({
      title: site.css("h1").text,
      resource: resource,
      content: site.css("section").text
      })
  end

  def self.parser_aljazeera(resource)
    site = Nokogiri::HTML(open(resource.link))

    OpenStruct.new({
      title: site.css("hrgroup").text,
      resource: resource,
      content: site.css(".article-body").text
      })
  end

  def self.parser_npr(resource)
    site = Nokogiri::HTML(open(resource.link))

    OpenStruct.new({
      title: site.css(".storytitle").text,
      resource: resource,
      content: site.css("p").text
      })
  end

#create other parsers for other news sites

end
