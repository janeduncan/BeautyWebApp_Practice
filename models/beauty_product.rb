require_relative('../db/sql_runner')

class BeautyProduct

  attr_reader :brand, :category, :colour, :id

  def initialize(options)
    @id = options['id'].to_i()
    @brand = options['brand']
    @category = options['category']
    @colour = options['colour']
  end

  def save()
    sql = "INSERT INTO beauty_products (brand, category, colour)
          VALUES ($1, $2, $3) RETURNING id"
    values = [@brand, @category, @colour]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def update()
    sql = "UPDATE beauty_products SET (brand, category, colour)
          = ($1, $2, $3) WHERE id = $4"
    values = [@brand, @category, @colour, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM beauty_products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE * FROM beauty_products"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM beauty_products"
    products = SqlRunner.run(sql)
    return products.map { |product| BeautyProduct.new(product)}
  end

  def self.find(id)
    sql = "SELECT * FROM beauty_products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    result = BeautyProduct.new(product.first)
    return result
  end

end
