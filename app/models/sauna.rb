class Sauna
  include ActiveModel::Model
  attr_accessor :user_id,:name,:id, :created_at, :datetime, :updated_at, :datetime, :prefecture_id,:postcode, :city, :block, :building,:homepage,:image,:hot_spring_id ,:hot_temperture,:cold_temperture,:people_count,:remarks,:w_hot_temperture,:w_cold_temperture,:w_people_count,:w_remarks


  with_options presence: true do
    validates :name
    validates :postcode
    validates :city
    validates :block 
  end

  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン（-）を入れてください"}, allow_blank: true
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" } 
 

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

    def update(params, hot_spring)

      #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
      hot_temperture = params.delete(:hot_temperture)
      cold_temperture = params.delete(:cold_temperture)
      people_count = params.delete(:people_count)
      remarks = params.delete(:remarks)
      w_hot_temperture = params.delete(:w_hot_temperture)
      w_cold_temperture = params.delete(:w_cold_temperture)
      w_people_count = params.delete(:w_people_count)
      w_remarks = params.delete(:w_remarks)
      
  
      #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
      man_sauna = ManSauna.where(hot_temperture: hot_temperture).first_or_initialize if hot_temperture.present?
      man_sauna = ManSauna.where(cold_temperture: cold_temperture).first_or_initialize if cold_temperture.present?
      man_sauna = ManSauna.where(people_count: people_count).first_or_initialize if people_count.present?
      man_sauna = ManSauna.where(remarks: remarks).first_or_initialize if remarks.present?
      woman_sauna = WomanSauna.where(w_hot_temperture: w_hot_temperture).first_or_initialize if w_hot_temperture.present?
      woman_sauna = WomanSauna.where(w_cold_temperture: w_cold_temperture).first_or_initialize if w_cold_temperture.present?
      woman_sauna = WomanSauna.where(w_people_count: w_people_count).first_or_initialize if w_people_count.present?
      woman_sauna = WomanSauna.where(w_remarks: w_remarks).first_or_initialize if w_remarks.present?
  
      #タグを保存
      ManSauna.update(hot_temperture: hot_temperture,cold_temperture: cold_temperture, people_count: people_count, remarks: remarks)
      WomanSauna.update(w_hot_temperture: w_hot_temperture,w_cold_temperture: w_cold_temperture, w_people_count: w_people_count, w_remarks: w_remarks)
      hot_spring.update(params)
    end
end