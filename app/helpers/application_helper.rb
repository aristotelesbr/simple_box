module ApplicationHelper
	def last_sales
    Sale.order(created_at: 'DESC').limit(5)
  end

  def to_br(date)
  	date.strftime('%d/%m/%Y')
  end

  def total
  	@total ||= Sale.all.inject(0) { |tot, i| tot += (i.unit_price * i.quantity) }
  end
end
