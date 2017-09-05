class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 15_00
   }
  end

  def create
    customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: 15_00,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
   
   current_user.update_attributes(role: 'premium')
 
   flash[:notice] = "Thank you for your contribution, #{current_user.email}! Enjoy premium!"
   redirect_to wikis_path
 
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end
  
  def destroy
    current_user.update_attributes(role: 'standard')
    current_user.wikis each do |wiki|
        wiki.private = false
    end
    flash[:notice] = "We hope you re-consider #{current_user.email}, your account is now standard!"
    redirect_to wikis_path
  end
  
end
