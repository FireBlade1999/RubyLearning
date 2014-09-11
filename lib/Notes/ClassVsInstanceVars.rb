

#
# Class (static) level variables in Ruby have the @@ annotation
# 
# Instance level variables in Ruby have the @ annotation
# 
# eg
#   class DoDa
#     @@http_proxy = HttpProxy.new()
#   end
#   
#   class DoDa
#     attr_accessor :http_proxy
#     @http_proxy = HttpProxy.new()
#   end
#