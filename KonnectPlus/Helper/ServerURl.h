//
//  ServerURl.h
//  TasDelasApp
//
//  Created by One Platinum on 9/4/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#ifndef TasDelasApp_ServerURl_h
#define TasDelasApp_ServerURl_h
#define SCREEN_HEIGHT  [[UIScreen mainScreen]bounds].size.height
#define IS_WIDESCREEN ( [ [ UIScreen mainScreen ] bounds ].size.height == 568 )
#define IS_IPHONE     ( [[[UIDevice currentDevice] model] rangeOfString:@"iPhone"].location != NSNotFound )
#define IS_IPAD       ( [[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound )

#define IS_IPHONE5    ( !IS_IPAD && IS_WIDESCREEN )

//local base url
//#define BASE_URL @"http://192.168.1.241/api/"
//#define IMAGE_BASE_URL @"http://192.168.1.241/tasdeals/uploads/deals/medium"
//#define ACCOMMODATION_IMAGE_URL @"http://192.168.1.241/tasdeals/uploads/business_deals/medium"


// live base urls
#define BASE_URL @"http://api.tasdeals.com.au"
#define IMAGE_BASE_URL @"http://tasdeals.com.au/uploads/deals/medium"
#define ACCOMMODATION_IMAGE_URL @"http://tasdeals.com.au/uploads/business_deals/medium"

//live destroy session
#define REMOVE_SESSION @"Deals/complete_checkout.json"

//local destroy session
//#define REMOVE_SESSION @"Deals/complete_checkout.json"

//logout url
#define LOGOUT_URL @"Users/logout.json"

//deals url
#define POPULAR_DEALS_URL @"Deals/popular_item.json"
#define TOP_DEAL @"Deals/top_deal.json"
#define SIDEBAR_DEAL @"Deals/side_deal.json"
#define MAIN_DEAL @"Deals/main_deal.json"

//deals pagination url
#define DEAL_PAGINATION_URl @"Deals/side_deal"
//product url
#define PDODUCT_MAIN_DEAL @"Deals/main_deal.json"
#define LISTING_CATEGORY @"Categories/subcategory.json"
#define PRODUCT_DEAL @"Deals/products.json"
#define POPULAR_PRODUCT_DEAL @"Deals/popular_item/2.json"
//product pagination url
#define PRODUCT_PAGINATION_URL @"Deals/products/"

//categorywise listing url
#define CATEGORY_PRODUCTLIST_URl @"Deals/category_product.json"
#define CATEGORY_LIST_PAGINATION_URL @"Deals/category_product"
//cellar url

#define MAIN_CELLAR_DEAL @"Deals/main_deal.json"
#define CELLAR_SIDE_DEAL @"Deals/side_deal.json"
#define CELLA_POPULAR_PRODUCT @"Deals/popular_item.json"
//cellar pagination url
#define CELLAR_PAGINAION_URL @"Deals/side_deal/"

//Detailsview url

#define DETAILS_DEAL @"Deals/deal_view.json"
#define DETAILS_BUSINESS_URL @"BusinessDeals/business_deal_detail.json"

//accommodation url
#define ACCOMODATION_DEAL @"BusinessDeals/business_deal.json"
#define ACCOMMODATION_ADDITIONAL_URL @"BusinessDealsAdditionalOptions/business_addition.json"
//accommodation pagination url
#define ACCOMMODATION_PAGINATION_URL @"BusinessDeals/business_deal/accomodation/"

//adventure url
#define ADVENTURE_DEAL @"BusinessDeals/business_deal.json"
//adventure pagination url
#define ADVENTURE_PAGINATION_URL @"BusinessDeals/business_deal/adventure/"


//login url
#define LOGIN_URL @"Users/login.json"
//facebook register
#define FACEBOOK_REGISTER_URl @"Users/fb_login.json"

//additional deal
#define ADDITIONAL_DEAL_URL @"DealsAdditionalOptions/deal_addition.json"

//add to cart
#define ADDCART_URL @"Deals/add_to_cart.json"
//update cart
#define UPDATE_CART_URL @"Deals/update_cart.json"
//show cart
#define SHOW_CART_URL @"Deals/cart.json"
#define GUEST_CHECKOUT_URL @"Deals/checkout.json"
#define GUEST_CART_URL @"Deals/payment.json"
#define PROMOTION_CODE_URL @"PromoCodes/search_code.json"
//user Register url
#define USER_REGISTER_URL @"Deals/register.json"

//pages urls
#define PAGES_URL @"Pages/feature.json"

//faqs url
#define FAQ_URL @"Faqs/listing.json"

//delete product
#define DELETE_CART_URL @"Deals/remove_from_cart.json"

//booking data
#define BOOKING @"Bookings/add.json"
//contact us
#define CONTACT_US @"Deals/contact_us.json"
#define REGISTER @"Users/register.json"
//for checkout response from paypal server
#define PAYPAL_RESPONSE_URL @"Deals/pp_return.json"

//user managemtn urls
#define MY_ACCOUNT_URL @"Users/my_account.json"
#define UPDATE_MY_ACCOUNT_URL @"Users/update_myaccount.json"
#define CHANEG_PASSWORD_URL @"Users/change_password.json"
#define ADDUSER_ADDRESS_URL @"UserAddressBooks/add.json"
#define USER_ADDRESSBOOK_URL @"UserAddressBooks/listing.json"
#define USER_VIEW_ADDRESS_URL @"UserAddressBooks/view.json"
#define USER_ADDRESS_UPDATE_URL @"UserAddressBooks/edit.json"
#define STATES_LIST_URL @"States/index.json"
#define USER_COUPON_URL @"Coupons/index.json"
#define GUEST_USER_DETAIL @"GuestCheckouts/add.json"
#define USER_SHIPPING_URL @"ShippingBillingAddresses/add.json"

#endif
