Rails.application.routes.draw do
  get("/", { :controller => "page", :action => "default"})
  get("/square/new", { :controller => "page", :action => "square"})
  get("/square/results", { :controller => "page", :action => "square_results"})
  get("/square_root/new", { :controller => "page", :action => "square_root"})
  get("/square_root/results", { :controller => "page", :action => "square_root_results"})
  get("/payment/new", { :controller => "page", :action => "payment"})
  get("/payment/results", { :controller => "page", :action => "payment_results"})
  get("/random/new", { :controller => "page", :action => "random_number"})
  get("/random/results", { :controller => "page", :action => "random_number_results"})
end
