json.extract! brand, :id, :name, :description, :image, :sport, :category,
              :pricepoint, :highlyrated, :created_at, :updated_at
json.url brand_url(brand, format: :json)
