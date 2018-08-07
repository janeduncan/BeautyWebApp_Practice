require_relative('../models/beauty_product.rb')

# BeautyProduct.delete_all()

product1 = BeautyProduct.new({
  "brand" => "Dior",
  "category" => "Lipstick",
  "colour" => "Red"
})

product2 = BeautyProduct.new({
  "brand" => "Chanel",
  "category" => "Blush",
  "colour" => "Pink"
})

product3 = BeautyProduct.new({
  "brand" => "Lancome",
  "category" => "Eyeshadow",
  "colour" => "Gold"
})

product4 = BeautyProduct.new({
  "brand" => "Smashbox",
  "category" => "Mascara",
  "colour" => "Black"
})

product1.save()
product2.save()
product3.save()
product4.save()
