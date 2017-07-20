I want to see my orders
- get me all the orders that client `x` made


SELECT clients.first_name, clients.last_name, orders.id as order_id, orders.date  from clients join orders ON clients.id = orders.client_id where clients.id = 1;

Order.joins(:client).where("clients.id = 1")


@id = INSERT ID HERE
 Order.joins(:client).where("clients.id = :id", id: @id)

> I want to see the products I bought + how many times
- get me all the unique products that client `x` bought


 @orders = Order.where( "client_id =1")
 @orders.pluck(:id) #OR  @orders.map(&:id)

 @products_id = OrderProduct.where("order_products.order_id IN (?)",  @orders.pluck(:id))
 @products_id.pluck(:product_id)


OrderProduct.where("order_products.order_id IN (?)",  @orders.pluck(:id)).group(:product_id).sum(:quantity)

OR"
OrderProduct.joins(:order).where("orders.client_id = 1").group(:product_id).sum(:quantity")

> I want to see the manufacturers I had business with
- get me all the unique manufacturers that client `x` has business with

> I want to filter the products by manufacturers
- get me the products manufactured by manufacturer `x`

> As an admin, I know products I received yesterday from manufacturer `x` have faulty hardware. I want to call the clients who bought them and revoke the purchased merchandise.
- get me all the clients that ordered products yesterday from manufacturer `x`

> I received a request from a survey company that wants to know the average age of people who bought the latest iPhone
- get me all the average age of the clients that brought an iPhone

> I get commissions from manufacturers depending on sale
- get me the total amount spent on products from manufacturer `x` in the last month (edited)




# GTAmazon
