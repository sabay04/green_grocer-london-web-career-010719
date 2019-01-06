

def consolidate_cart(cart)
    arranged_cart = {}
#    count = 0
  cart.each do |item|
      item.each do |fruit, data|
    arranged_cart[fruit] ||= data    # ||= if there is nothing in there then fill with data
    arranged_cart[fruit][:count] ||= 0   #if there is nothing in count the nfill with 0
    arranged_cart[fruit][:count] += 1
     end
  end
  arranged_cart
end


def apply_coupons(cart, coupons)
    # code here
    coupons_applied = {}
        coupons.each do |coupon|
        
            grocery = coupon[:item]
        
                if cart.key?(grocery)
                    coupon_count = 0
                until coupon[:num] > cart[grocery][:count]
                    cart[grocery][:count] -= coupon[:num]
                    
                    coupons_applied["#{grocery} W/COUPON"] = {price: coupon[:cost], clearance: cart[grocery][:clearance], count: coupon_count += 1}
            end
        end
    end
    cart.merge(coupons_applied)
end


def apply_clearance(cart)
    
    
    cart.each do | item , data |
        if data[:clearance] == true
            data[:price] = (data[:price]*0.8).round(2)
        end
        
    end
    cart
end


def checkout(cart, coupons)
  # code here
  cart1 = consolidate_cart(cart)
  cart2 = apply_coupons(cart1, coupons)
  cart3 = apply_clearance(cart2)
  
  total = 0
    cart3.each do |name, data|
      total += data[:price] * data[:count]
      
      end
   if total > 100
    total = total * 0.9
    end
   
   total
   
end


