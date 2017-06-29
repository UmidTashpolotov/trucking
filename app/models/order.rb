class Order < ApplicationRecord
  belongs_to :user
  belongs_to :worker, class_name: 'User'
  has_many :offers, dependent: :destroy
  has_many :comments

  validates :about, presence: true
  validates :from_city, presence: true
  validates :to_city, presence: true
  validates :cargo, presence: true
  validates :price, presence: true

  def selected_offer
    self.offers.where(accepted: true)
  end

  def open
    self.status = 'open'
    save
  end

  def in_progress
    self.status = 'in_progress'
    save
  end

  def close
    self.status = 'closed'
    save
  end

  def complete
    self.status = 'completed'
    save
  end

  def has_comment_from(user)
    comments.exists?(from_user: user)
  end

  def add_view_number
    update_attribute :number_of_views, number_of_views + 1
  end

  def find_coordinates
    url = URI("https://maps.googleapis.com/maps/api/directions/json")
    url.query = URI.encode_www_form({ origin: from_city, destination: to_city })
    res = Net::HTTP.get_response(url)
    json_data = res.body if res.is_a?(Net::HTTPSuccess)
    data = JSON.parse(json_data)
    if data['routes'].blank?
      nil
    else
      data['routes'][0]['overview_polyline']['points']
    end
  end

end