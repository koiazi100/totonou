class Sauna
  include ActiveModel::Model
  attr_accessor :user_id,:name,:id, :created_at, :datetime, :updated_at, :datetime, :prefecture_id,:postcode, :city, :block, :building,:homepage,:image,:hot_spring_id ,:hot_temperture,:cold_temperture,:people_count,:remarks,:w_hot_temperture,:w_cold_temperture,:w_people_count,:w_remarks


  with_options presence: true do
    validates :name
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block 
    validates :homepage
  end


 

    validates :hot_temperture, numericality: {only_integer: true} , allow_blank: true
    validates :cold_temperture, numericality: {only_integer: true}, allow_blank: true
    validates :people_count, numericality: {only_integer: true}, allow_blank: true
    validates :w_hot_temperture, numericality: {only_integer: true} , allow_blank: true
    validates :w_cold_temperture, numericality: {only_integer: true}, allow_blank: true
    validates :w_people_count, numericality: {only_integer: true}, allow_blank: true
    
    
    def save
      hot_spring = HotSpring.create( name: name, prefecture_id: prefecture_id,postcode: postcode,city: city,block: block,building: building,homepage: homepage,user_id: user_id,image: image)
      ManSauna.create(hot_temperture: hot_temperture,cold_temperture: cold_temperture, people_count: people_count, remarks: remarks, hot_spring_id: hot_spring.id)
      WomanSauna.create(w_hot_temperture: w_hot_temperture,w_cold_temperture: w_cold_temperture, w_people_count: w_people_count, w_remarks: w_remarks, hot_spring_id: hot_spring.id)
    end

end