class Page < ActiveRecord::Base
# validations
  validates :title, presence: true, uniqueness: true

# relationships
  has_many :comments, as: :commentable, dependent: :destroy

# methods
  def to_s
    title
  end

# class methods
  def self.descarga
    @@descarga ||= find_by(title: "Descarga")
  end

  def self.otros_productos
    @@otros_productos ||= find_by(title: "Otros productos")
  end
end
