class Url < ActiveRecord::Base
  validates :url, :format => {:with => /^(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, 
                             :message => "is not valid. Please try again." }
  before_create :create_short_url

  def increment_click!
   self.click_count += 1
   self.save
  end

  def create_short_url
    token = create_token
    self.short_url = token
  end

  private
  def create_token
    random = ""
    3.times { random << rand(1..9).to_s}
    2.times { random << ("a".."z").to_a.sample}
    token = random.split.shuffle.join
  end
  
end
