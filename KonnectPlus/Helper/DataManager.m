//
//  DataManager.m
//  TasDelasApp
//
//  Created by One Platinum on 9/4/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "DataManager.h"
#import "AppDelegate.h"

static DataManager * _sharedDataManager = nil;

@implementation DataManager
+ (DataManager *) sharedDataManger{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataManager = [[DataManager alloc] init];
    });
    return _sharedDataManager;
}
/*
- (NSMutableArray *) getDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);

    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];

       for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        deal=[DealsVCDictionary objectForKey:@"Deal"];

        DealsDataModel *dealsDataModel = [[DealsDataModel alloc] init];
        dealsDataModel.dealsId                = [deal valueForKey:@"id"];
        dealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        dealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        dealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_save_percent"];
        dealsDataModel.imageURL               =[deal valueForKey:@"deal_image_url"];
        dealsDataModel.slug                    =[deal valueForKey:@"slug"];
        dealsDataModel.deals_face_value        =[deal valueForKey:@"deal_face_value"];
        dealsDataModel.quantity        =[deal valueForKey:@"quantity"];
        dealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
        dealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];

        [dealsDataArray addObject:dealsDataModel];

            }

    return dealsDataArray;
}

- (NSMutableArray *) getAdditionalDealsData:(NSArray *) resultArray{
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        deal=[DealsVCDictionary objectForKey:@"DealsAdditionalOption"];
        
        DealAdditionalDataModel *dealsAddDataModel = [[DealAdditionalDataModel alloc] init];
        dealsAddDataModel.additional_id                = [deal valueForKey:@"id"];
        dealsAddDataModel.additional_title             = [deal valueForKey:@"additional_title"];
        dealsAddDataModel.additional_price              = [deal valueForKey:@"additional_price"];
        dealsAddDataModel.additional_rrp           = [deal valueForKey:@"additional_rrp"];
        dealsAddDataModel.parent_id               =[deal valueForKey:@"deals_id"];
        
        [dealsDataArray addObject:dealsAddDataModel];
        
        
        
    }
    
    
    
    return dealsDataArray;
}




- (NSMutableArray *) getAdditionalDealsDataForAccommodation:(NSArray *) resultArray{
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        deal=[DealsVCDictionary objectForKey:@"BusinessDealsAdditionalOption"];
        
        DealAdditionalDataModel *dealsAddDataModel = [[DealAdditionalDataModel alloc] init];
        dealsAddDataModel.additional_id                = [deal valueForKey:@"id"];
        dealsAddDataModel.additional_title             = [deal valueForKey:@"additional_title"];
        dealsAddDataModel.additional_price              = [deal valueForKey:@"additional_price"];
        dealsAddDataModel.additional_rrp           = [deal valueForKey:@"additional_rrp"];
        dealsAddDataModel.parent_id               =[deal valueForKey:@"deals_id"];
        
        [dealsDataArray addObject:dealsAddDataModel];
        
        
        
    }
    
    
    
    return dealsDataArray;
}


- (NSMutableArray *) getMainDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
  //  for(int i = 0; i < [resultArray count]; i++)
   // {
      //  DealsVCDictionary = [resultArray objectAtIndex:0];
       // NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[resultArray valueForKey:@"Deal"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        MainDealsDataModel *dealsDataModel = [[MainDealsDataModel alloc] init];
        dealsDataModel.dealsId                = [deal valueForKey:@"id"];
        dealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        dealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        dealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_save_percent"];
        dealsDataModel.imageURL               =[deal valueForKey:@"deal_image_url"];
        dealsDataModel.slug                    =[deal valueForKey:@"slug"];
        dealsDataModel.deals_face_value        =[deal valueForKey:@"deal_face_value"];
    dealsDataModel.quantity        =[deal valueForKey:@"quantity"];
    dealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
    dealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];


        NSLog(@"id:%@",dealsDataModel.imageURL);
        [dealsDataArray addObject:dealsDataModel];
        // }
   // }
    
    return dealsDataArray;
}
- (NSMutableArray *) getproductsData:(NSArray *) resultArray{
    
    NSMutableArray *products=[[NSMutableArray alloc]init];
    NSMutableDictionary * ProductsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * productDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        ProductsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",ProductsVCDictionary);
        // Parsing Feeds
        products=[ProductsVCDictionary objectForKey:@"Deal"];
        NSLog(@"my deal is  :%@",products);
        
        ///for(int j = 0; j < [deal count]; j++){
        ProductModel *productsDataModel = [[ProductModel alloc] init];
        productsDataModel.product_id                = [products valueForKey:@"id"];
        productsDataModel.title             = [products valueForKey:@"deal_title"];
        productsDataModel.price1              = [products valueForKey:@"deal_price"];
        productsDataModel.dis_per           = [products valueForKey:@"deal_save_percent"];
        productsDataModel.imageURL               =[products valueForKey:@"deal_image_url"];
        productsDataModel.slug                    =[products valueForKey:@"slug"];
        productsDataModel.price2        =[products valueForKey:@"deal_face_value"];
        productsDataModel.quantity        =[products valueForKey:@"quantity"];
        productsDataModel.deal_start_date=[products valueForKey:@"deal_start_date"];
        productsDataModel.deal_end_date=[products valueForKey:@"deal_end_date"];

        NSLog(@"id:%@",productsDataModel.imageURL);
        [productDataArray addObject:productsDataModel];
        // }
    }
    
    return productDataArray;
}

- (NSMutableArray *) getMainproductsData:(NSArray *) resultArray{
    
    NSMutableArray *products=[[NSMutableArray alloc]init];
    NSMutableArray * productDataArray = [[NSMutableArray alloc] init];
    
        // Parsing Feeds
        products=[resultArray valueForKey:@"Deal"];
        NSLog(@"my deal is  :%@",products);
        
        ///for(int j = 0; j < [deal count]; j++){
        MainProductModel *productsDataModel = [[MainProductModel alloc] init];
        productsDataModel.product_id                = [products valueForKey:@"id"];
        productsDataModel.title             = [products valueForKey:@"deal_title"];
        productsDataModel.price1              = [products valueForKey:@"deal_price"];
        productsDataModel.dis_per           = [products valueForKey:@"deal_save_percent"];
        productsDataModel.imageURL               =[products valueForKey:@"deal_image_url"];
        productsDataModel.slug                    =[products valueForKey:@"slug"];
        productsDataModel.price2        =[products valueForKey:@"deal_face_value"];
    productsDataModel.quantity        =[products valueForKey:@"quantity"];
    productsDataModel.deal_start_date=[products valueForKey:@"deal_start_date"];
    productsDataModel.deal_end_date=[products valueForKey:@"deal_end_date"];

        NSLog(@"id:%@",productsDataModel.imageURL);
        [productDataArray addObject:productsDataModel];
    
    
    return productDataArray;
}

- (NSMutableArray *) getAccDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"BusinessDeal"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        AccommodationDataModel *AccdealsDataModel = [[AccommodationDataModel alloc] init];
        AccdealsDataModel.dealsId                = [deal valueForKey:@"id"];
        AccdealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        AccdealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        AccdealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_discount"];
        AccdealsDataModel.imageURL               =[deal valueForKey:@"images"];
        AccdealsDataModel.slug                    =[deal valueForKey:@"slug"];
        AccdealsDataModel.deals_face_value        =[deal valueForKey:@"deal_actual_price"];
        AccdealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
        AccdealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];
        NSLog(@"id:%@",AccdealsDataModel.imageURL);
        [dealsDataArray addObject:AccdealsDataModel];
        // }
    }
    
    return dealsDataArray;
}
- (NSMutableArray *) getAdventureDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"BusinessDeal"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        AdventureDataModel *AdventuredealsDataModel = [[AdventureDataModel alloc] init];
        AdventuredealsDataModel.dealsId                = [deal valueForKey:@"id"];
        AdventuredealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        AdventuredealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        AdventuredealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_discount"];
        AdventuredealsDataModel.imageURL               =[deal valueForKey:@"images"];
        AdventuredealsDataModel.slug                    =[deal valueForKey:@"slug"];
        AdventuredealsDataModel.deals_face_value        =[deal valueForKey:@"deal_actual_price"];
        AdventuredealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
        AdventuredealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];
        NSLog(@"id:%@",AdventuredealsDataModel.imageURL);
        [dealsDataArray addObject:AdventuredealsDataModel];
        // }
    }
    
    return dealsDataArray;
}
- (NSMutableArray *) getPopularProductDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"Deal"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        PopularProductDataModel *dealsDataModel = [[PopularProductDataModel alloc] init];
        dealsDataModel.dealsId                = [deal valueForKey:@"id"];
        dealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        dealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        dealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_save_percent"];
        dealsDataModel.imageURL               =[deal valueForKey:@"deal_image_url"];
        dealsDataModel.slug                    =[deal valueForKey:@"slug"];
        dealsDataModel.deals_face_value        =[deal valueForKey:@"deal_face_value"];
        dealsDataModel.quantity        =[deal valueForKey:@"quantity"];
        dealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
        dealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];

        NSLog(@"id:%@",dealsDataModel.imageURL);
        [dealsDataArray addObject:dealsDataModel];
        // }
    }
    return dealsDataArray;

}
- (NSMutableArray *) GetCategoryListData:(NSArray *) resultArray{
    
    NSMutableArray *products=[[NSMutableArray alloc]init];
    NSMutableDictionary * ProductsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * productDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        ProductsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",ProductsVCDictionary);
        // Parsing Feeds
        products=[ProductsVCDictionary objectForKey:@"Category"];
        NSLog(@"my deal is  :%@",products);
        
        ///for(int j = 0; j < [deal count]; j++){
        ProductCategoryListDataModel *productsDataModel = [[ProductCategoryListDataModel alloc] init];
        productsDataModel.cat_id                = [products valueForKey:@"id"];
        productsDataModel.name             = [products valueForKey:@"name"];
        productsDataModel.parant_id              = [products valueForKey:@"parent_id"];
        productsDataModel.slug           = [products valueForKey:@"slug"];
        productsDataModel.status               =[products valueForKey:@"status"];
        productsDataModel.sort_order        =[products valueForKey:@"sort_order"];
        productsDataModel.quantity        =[products valueForKey:@"quantity"];

        [productDataArray addObject:productsDataModel];
        // }
    }
    
    
    
    
    return productDataArray;
}
- (NSMutableArray *) getMainCellarDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];

    deal=[resultArray valueForKey:@"Deal"];
    NSLog(@"my deal is  :%@",deal);
    
    ///for(int j = 0; j < [deal count]; j++){
    MainCellarDataModel *dealsDataModel = [[MainCellarDataModel alloc] init];
    dealsDataModel.dealsId                = [deal valueForKey:@"id"];
    dealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
    dealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
    dealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_save_percent"];
    dealsDataModel.imageURL               =[deal valueForKey:@"deal_image_url"];
    dealsDataModel.slug                    =[deal valueForKey:@"slug"];
    dealsDataModel.deals_face_value        =[deal valueForKey:@"deal_face_value"];
    dealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
    dealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];
    NSLog(@"id:%@",dealsDataModel.imageURL);
    [dealsDataArray addObject:dealsDataModel];
    // }
    // }
    
    return dealsDataArray;
}
- (NSMutableArray *) getCellarDealsData:(NSMutableArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary *DealsVCDictionary = [[NSMutableDictionary alloc]init];
    NSMutableArray *dealsDataArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"Deal"];
        NSLog(@"my deal is  :%@",deal);
        CellarDataModel *dealsDataModel = [[CellarDataModel alloc] init];
        dealsDataModel.dealsId                = [deal valueForKey:@"id"];
        dealsDataModel.deals_title             = [deal valueForKey:@"deal_title"];
        dealsDataModel.deals_price              = [deal valueForKey:@"deal_price"];
        dealsDataModel.deals_save_percent           = [deal valueForKey:@"deal_save_percent"];
        dealsDataModel.imageURL               =[deal valueForKey:@"deal_image_url"];
        dealsDataModel.slug                    =[deal valueForKey:@"slug"];
        dealsDataModel.deals_face_value        =[deal valueForKey:@"deal_face_value"];
        dealsDataModel.deal_start_date=[deal valueForKey:@"deal_start_date"];
        dealsDataModel.deal_end_date=[deal valueForKey:@"deal_end_date"];
        NSLog(@"id:%@",dealsDataModel.imageURL);
        [dealsDataArray addObject:dealsDataModel];
        // }
    }
    return dealsDataArray;
}
- (NSMutableArray *) getFullDealsData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%@",resultArray);
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];

    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *MerchantArray=[[NSMutableArray alloc]init];

    
    deal=[resultArray valueForKey:@"Deal"];
    MerchantArray=[resultArray valueForKey:@"Merchant"];

        NSLog(@"my deal is  :%@",deal);
        
        DealDetailsDataModel *dealsDetailsDataModel = [[DealDetailsDataModel alloc] init];
        dealsDetailsDataModel.deal_id                = [deal valueForKey:@"id"];
        dealsDetailsDataModel.slug                   =[deal valueForKey:@"slug"];
        dealsDetailsDataModel.deal_title             = [deal valueForKey:@"deal_title"];
        dealsDetailsDataModel.deal_city              = [deal valueForKey:@"deal_city"];
        dealsDetailsDataModel.deal_des               = [deal valueForKey:@"deal_description"];
        dealsDetailsDataModel.deals_hightlight       =[deal valueForKey:@"deals_highlights"];
        dealsDetailsDataModel.deals_fine_prints      =[deal valueForKey:@"deals_fine_prints"];
        dealsDetailsDataModel.deal_category          =[deal valueForKey:@"deal_category"];
        dealsDetailsDataModel.deal_sub_category         =[deal valueForKey:@"deal_sub_category"];
        dealsDetailsDataModel.deal_price                =[deal valueForKey:@"deal_price"];
        dealsDetailsDataModel.deal_face_value           =[deal valueForKey:@"deal_face_value"];
        dealsDetailsDataModel.deal_save_percent         =[deal valueForKey:@"deal_save_percent"];
        dealsDetailsDataModel.deal_merchant_percent     =[deal valueForKey:@"deal_merchant_percent"];
        dealsDetailsDataModel.deal_groupon_percent         =[deal valueForKey:@"deal_groupon_percent"];
        dealsDetailsDataModel.dropdown_title            =[deal valueForKey:@"dropdown_title"];
        dealsDetailsDataModel.dropdrown_option          =[deal valueForKey:@"dropdrown_option"];
        dealsDetailsDataModel.deal_sold_out              =[deal valueForKey:@"deal_sold_out"];
        dealsDetailsDataModel.deal_start_date           =[deal valueForKey:@"deal_start_date"];
        dealsDetailsDataModel.deal_end_date               =[deal valueForKey:@"deal_end_date"];
        dealsDetailsDataModel.deal_voucher_start_date         =[deal valueForKey:@"deal_voucher_start_date"];
        dealsDetailsDataModel.deal_voucher_end_date         =[deal valueForKey:@"deal_voucher_end_date"];
        dealsDetailsDataModel.deal_publish_date         =[deal valueForKey:@"deal_publish_date"];
        dealsDetailsDataModel.deal_main_upto            =[deal valueForKey:@"deal_main_upto"];
        dealsDetailsDataModel.deal_min_count            =[deal valueForKey:@"deal_min_count"];
        dealsDetailsDataModel.deal_max_count            =[deal valueForKey:@"deal_max_count"];
        dealsDetailsDataModel.deal_max_puchaase_limit     =[deal valueForKey:@"deal_max_purchase_limit"];
        dealsDetailsDataModel.deal_max_gift_limitt      =[deal valueForKey:@"deal_max_gift_limit"];
        dealsDetailsDataModel.division_lng              =[deal valueForKey:@"division_lng"];
        dealsDetailsDataModel.division_lat              =[deal valueForKey:@"division_lat"];
        dealsDetailsDataModel.deal_image_url        =[deal valueForKey:@"deal_image_url"];
        dealsDetailsDataModel.merchent              =[deal valueForKey:@"merchent"];
        dealsDetailsDataModel.quantity              =[deal valueForKey:@"quantity"];
        dealsDetailsDataModel.seo_description       =[deal valueForKey:@"seo_description"];
        dealsDetailsDataModel.status                =[deal valueForKey:@"status"];
        dealsDetailsDataModel.post_date             =[deal valueForKey:@"post_date"];
        dealsDetailsDataModel.deals_viewed          =[deal valueForKey:@"deals_viewed"];
        dealsDetailsDataModel.deals_purchased       =[deal valueForKey:@"deals_purchased"];
        dealsDetailsDataModel.main_deal             =[deal valueForKey:@"main_deal"];
        dealsDetailsDataModel.is_deliverable        =[deal valueForKey:@"is_deliverable"];
        dealsDetailsDataModel.free_deliverable      =[deal valueForKey:@"free_deliverable"];
        dealsDetailsDataModel.sort_order            =[deal valueForKey:@"sort_order"];
        dealsDetailsDataModel.past_deals            =[deal valueForKey:@"past_deals"];
        dealsDetailsDataModel.share_link            =[deal valueForKey:@"share_link"];
        dealsDetailsDataModel.expired               =[deal valueForKey:@"expired"];
    //merchant array
    dealsDetailsDataModel.address                = [MerchantArray valueForKey:@"address"];
    dealsDetailsDataModel.company_name                = [MerchantArray valueForKey:@"company_name"];
    dealsDetailsDataModel.site_url                = [MerchantArray valueForKey:@"site_url"];




        [dealsDataArray addObject:dealsDetailsDataModel];
    
    return dealsDataArray;
}

- (NSMutableArray *) getFullDealsDataForBusiness:(NSArray *) resultArray{
    NSLog(@"my deal is  :%@",resultArray);
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *MerchantArray=[[NSMutableArray alloc]init];
    
    
    deal=[resultArray valueForKey:@"BusinessDeal"];
    MerchantArray=[resultArray valueForKey:@"Merchant"];
    
    NSLog(@"my deal is  :%@",deal);
    
    DealDetailsDataModel *dealsDetailsDataModel = [[DealDetailsDataModel alloc] init];
    dealsDetailsDataModel.deal_id                = [deal valueForKey:@"id"];
    dealsDetailsDataModel.slug                   =[deal valueForKey:@"slug"];
    dealsDetailsDataModel.deal_title             = [deal valueForKey:@"deal_title"];
    dealsDetailsDataModel.deal_city              = [deal valueForKey:@"deal_city"];
    dealsDetailsDataModel.deal_des               = [deal valueForKey:@"deal_description"];
    dealsDetailsDataModel.deals_hightlight       =[deal valueForKey:@"deals_highlights"];
    dealsDetailsDataModel.deals_fine_prints      =[deal valueForKey:@"deals_fine_prints"];
    dealsDetailsDataModel.deal_category          =[deal valueForKey:@"deal_category"];
    dealsDetailsDataModel.deal_sub_category         =[deal valueForKey:@"deal_sub_category"];
    dealsDetailsDataModel.deal_price                =[deal valueForKey:@"deal_price"];
    dealsDetailsDataModel.deal_face_value           =[deal valueForKey:@"deal_face_value"];
    dealsDetailsDataModel.deal_save_percent         =[deal valueForKey:@"deal_discount"];
    dealsDetailsDataModel.deal_merchant_percent     =[deal valueForKey:@"deal_merchant_percent"];
    dealsDetailsDataModel.deal_groupon_percent         =[deal valueForKey:@"deal_groupon_percent"];
    dealsDetailsDataModel.dropdown_title            =[deal valueForKey:@"dropdown_title"];
    dealsDetailsDataModel.dropdrown_option          =[deal valueForKey:@"dropdrown_option"];
    dealsDetailsDataModel.deal_sold_out              =[deal valueForKey:@"deal_sold_out"];
    dealsDetailsDataModel.deal_start_date           =[deal valueForKey:@"deal_start_date"];
    dealsDetailsDataModel.deal_end_date               =[deal valueForKey:@"deal_end_date"];
    dealsDetailsDataModel.deal_voucher_start_date         =[deal valueForKey:@"deal_voucher_start_date"];
    dealsDetailsDataModel.deal_voucher_end_date         =[deal valueForKey:@"deal_voucher_end_date"];
    dealsDetailsDataModel.deal_publish_date         =[deal valueForKey:@"deal_publish_date"];
    dealsDetailsDataModel.deal_main_upto            =[deal valueForKey:@"deal_main_upto"];
    dealsDetailsDataModel.deal_min_count            =[deal valueForKey:@"deal_min_count"];
    dealsDetailsDataModel.deal_max_count            =[deal valueForKey:@"deal_max_count"];
    dealsDetailsDataModel.deal_max_puchaase_limit     =[deal valueForKey:@"deal_max_purchase_limit"];
    dealsDetailsDataModel.deal_max_gift_limitt      =[deal valueForKey:@"deal_max_gift_limit"];
    dealsDetailsDataModel.division_lng              =[deal valueForKey:@"division_lng"];
    dealsDetailsDataModel.division_lat              =[deal valueForKey:@"division_lat"];
    dealsDetailsDataModel.deal_image_url        =[deal valueForKey:@"images"];
    dealsDetailsDataModel.merchent              =[deal valueForKey:@"merchent"];
    dealsDetailsDataModel.quantity              =[deal valueForKey:@"quantity"];
    dealsDetailsDataModel.seo_description       =[deal valueForKey:@"seo_description"];
    dealsDetailsDataModel.status                =[deal valueForKey:@"status"];
    dealsDetailsDataModel.post_date             =[deal valueForKey:@"post_date"];
    dealsDetailsDataModel.deals_viewed          =[deal valueForKey:@"deals_viewed"];
    dealsDetailsDataModel.deals_purchased       =[deal valueForKey:@"deals_purchased"];
    dealsDetailsDataModel.main_deal             =[deal valueForKey:@"main_deal"];
    dealsDetailsDataModel.is_deliverable        =[deal valueForKey:@"is_deliverable"];
    dealsDetailsDataModel.free_deliverable      =[deal valueForKey:@"free_deliverable"];
    dealsDetailsDataModel.sort_order            =[deal valueForKey:@"sort_order"];
    dealsDetailsDataModel.past_deals            =[deal valueForKey:@"past_deals"];
    dealsDetailsDataModel.share_link            =[deal valueForKey:@"share_link"];
    dealsDetailsDataModel.expired               =[deal valueForKey:@"expired"];
    //merchant array
    dealsDetailsDataModel.address                = [MerchantArray valueForKey:@"address"];
    dealsDetailsDataModel.company_name                = [MerchantArray valueForKey:@"company_name"];
    dealsDetailsDataModel.site_url                = [MerchantArray valueForKey:@"site_url"];
    
    
    
    
    [dealsDataArray addObject:dealsDetailsDataModel];
    
    return dealsDataArray;
}
-(NSMutableArray *) getCartItem:(NSMutableArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    NSMutableDictionary *DealsVCDictionary = [[NSMutableDictionary alloc]init];

    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
   //   for(int i = 0; i < [resultArray count]; i++)
    // {
      //DealsVCDictionary = [resultArray objectAtIndex:0];
     //NSLog(@"my dis  :%@",DealsVCDictionary);
    // Parsing Feeds
    deal=resultArray;
    
    for(int j = 0; j < [deal count]; j++){
        DealsVCDictionary = [deal objectAtIndex:j];
        

    CartDataModel *cartDataModel = [[CartDataModel alloc] init];
    cartDataModel.dealsId                = [DealsVCDictionary valueForKey:@"id"];
    cartDataModel.deals_title             = [DealsVCDictionary valueForKey:@"name"];
    cartDataModel.deals_price              = [DealsVCDictionary valueForKey:@"price"];
    cartDataModel.imageURL               =[DealsVCDictionary valueForKey:@"image"];
    cartDataModel.qty                   = [NSString stringWithFormat:@"%@", [DealsVCDictionary valueForKey:@"qty"]];
        cartDataModel.customized_id        =[DealsVCDictionary valueForKey:@"customized_id"];
        cartDataModel.dropdown_option        =[DealsVCDictionary valueForKey:@"dropdown_option"];


    NSLog(@"id:%@",cartDataModel.qty);
    [dealsDataArray addObject:cartDataModel];
     }
    
    return dealsDataArray;
}
-(NSMutableArray *) getGuestCartItem:(NSMutableArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    NSMutableDictionary *DealsVCDictionary = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    //   for(int i = 0; i < [resultArray count]; i++)
    // {
    //DealsVCDictionary = [resultArray objectAtIndex:0];
    //NSLog(@"my dis  :%@",DealsVCDictionary);
    // Parsing Feeds
    NSString *charge=[resultArray valueForKeyPath:@"charge"];
    deal=[resultArray valueForKey:@"Cart"];
    NSLog(@"my d  :%@",deal);

    for(int j = 0; j < [deal count]; j++){
        DealsVCDictionary = [deal objectAtIndex:j];
        
        GuestCheckOutCartDataModel *cartDataModel = [[GuestCheckOutCartDataModel alloc] init];
        cartDataModel.dealsId                = [DealsVCDictionary valueForKey:@"id"];
        cartDataModel.deals_title             = [DealsVCDictionary valueForKey:@"name"];
        cartDataModel.deals_price              = [DealsVCDictionary valueForKey:@"price"];
        cartDataModel.imageURL               =[DealsVCDictionary valueForKey:@"image"];
        cartDataModel.qty        =[DealsVCDictionary valueForKey:@"qty"];
        cartDataModel.customized_id        =[DealsVCDictionary valueForKey:@"customized_id"];
        cartDataModel.dropdown_option        =[DealsVCDictionary valueForKey:@"dropdown_option"];
        cartDataModel.subtotal        =[DealsVCDictionary valueForKey:@"subtotal"];
        cartDataModel.shipping_charge=[resultArray valueForKeyPath:@"charge"];

        
        
        NSLog(@"id:%@",cartDataModel.qty);
        [dealsDataArray addObject:cartDataModel];
    }
    
    return dealsDataArray;
}

- (NSMutableArray *) getaboutUsData:(NSArray *) resultArray{
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *dealsDataArray = [[NSMutableArray alloc]init];
    deal=[resultArray valueForKey:@"Page"];
    NSLog(@"my deal is  :%@",deal);
        AboutUsDataModel *aboutDataModel = [[AboutUsDataModel alloc] init];
        aboutDataModel.title                = [deal valueForKey:@"page_title"];
        aboutDataModel.des             = [deal valueForKey:@"content"];
    
        [dealsDataArray addObject:aboutDataModel];
    
    return dealsDataArray;
}

- (NSMutableArray *) getTermsData:(NSArray *) resultArray{
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *dealsDataArray = [[NSMutableArray alloc]init];
    deal=[resultArray valueForKey:@"Page"];
    NSLog(@"my deal is  :%@",deal);
    TermAndCondtionDataModel *termDataModel = [[TermAndCondtionDataModel alloc] init];
    termDataModel.title                = [deal valueForKey:@"page_title"];
    termDataModel.des             = [deal valueForKey:@"content"];
    
    [dealsDataArray addObject:termDataModel];
    
    return dealsDataArray;
}
- (NSMutableArray *) getFeatureData:(NSArray *) resultArray{
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *dealsDataArray = [[NSMutableArray alloc]init];
    deal=[resultArray valueForKey:@"Page"];
    NSLog(@"my deal is  :%@",deal);
    FeatureDataModel *featureDataModel = [[FeatureDataModel alloc] init];
    featureDataModel.title                = [deal valueForKey:@"page_title"];
    featureDataModel.des             = [deal valueForKey:@"content"];
    
    [dealsDataArray addObject:featureDataModel];
    
    return dealsDataArray;
}


- (NSMutableArray *) getFaqData:(NSArray *) resultArray{
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        deal=[DealsVCDictionary objectForKey:@"Faq"];
        
        FaqDataModel *dealFaqDataModel = [[FaqDataModel alloc] init];
        dealFaqDataModel.question                = [deal valueForKey:@"question"];
        dealFaqDataModel.faq_content             = [deal valueForKey:@"faq_content"];
        
        [dealsDataArray addObject:dealFaqDataModel];
        
        
        
    }
    return dealsDataArray;

}
- (NSMutableArray *) getHowItWorksData:(NSArray *) resultArray{
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableArray *dealsDataArray = [[NSMutableArray alloc]init];
    deal=[resultArray valueForKey:@"Page"];
    NSLog(@"my deal is  :%@",deal);
    HowItWorksDataModel *featureDataModel = [[HowItWorksDataModel alloc] init];
    featureDataModel.des                = [deal valueForKey:@"page_title"];
    featureDataModel.des             = [deal valueForKey:@"content"];
    
    [dealsDataArray addObject:featureDataModel];
    
    return dealsDataArray;
}

- (NSMutableArray *) getUserAddressData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"UserAddressBook"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        userAddressDataModel *DataModel = [[userAddressDataModel alloc] init];
        DataModel.address_id                = [deal valueForKey:@"id"];
        DataModel.user_id             = [deal valueForKey:@"user_id"];
        DataModel.company              = [deal valueForKey:@"company"];
        DataModel.first_name           = [deal valueForKey:@"first_name"];
        DataModel.last_name               =[deal valueForKey:@"last_name"];
        DataModel.email                    =[deal valueForKey:@"email"];
        DataModel.phone        =[deal valueForKey:@"phone"];
        DataModel.address1        =[deal valueForKey:@"address_1"];
        DataModel.address2        =[deal valueForKey:@"address_2"];
        DataModel.city        =[deal valueForKey:@"city"];
        DataModel.state        =[deal valueForKey:@"state"];
        DataModel.zip        =[deal valueForKey:@"zip"];
        DataModel.address_name        =[deal valueForKey:@"address_name"];
        DataModel.default_value        =[deal valueForKey:@"default"];

        
        [dealsDataArray addObject:DataModel];
        // }
    }
    
    return dealsDataArray;
}

- (NSMutableArray *) getUserCouponData:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"Coupon"];
        
        userCouponDataModel *DataModel = [[userCouponDataModel alloc] init];
        DataModel.coupon_id                = [deal valueForKey:@"id"];
        DataModel.order_id             = [deal valueForKey:@"order_id"];
        DataModel.user_id              = [deal valueForKey:@"user_id"];
        DataModel.order_number           = [deal valueForKey:@"order_number"];
        DataModel.coupon_number               =[deal valueForKey:@"coupon_number"];
        DataModel.coupon                    =[deal valueForKey:@"coupon"];
        DataModel.deal_id        =[deal valueForKey:@"deal_id"];
        DataModel.date        =[deal valueForKey:@"date"];
        DataModel.delivery_type        =[deal valueForKey:@"delivery_type"];
        
        
        [dealsDataArray addObject:DataModel];
        // }
    }
    
    return dealsDataArray;
}


- (NSMutableArray *) getStatesList:(NSArray *) resultArray{
    NSLog(@"my deal is  :%d",resultArray.count);
    
    NSMutableArray *deal=[[NSMutableArray alloc]init];
    NSMutableDictionary * DealsVCDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray * dealsDataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < [resultArray count]; i++)
    {
        DealsVCDictionary = [resultArray objectAtIndex:i];
        NSLog(@"my dis  :%@",DealsVCDictionary);
        // Parsing Feeds
        deal=[DealsVCDictionary objectForKey:@"State"];
        NSLog(@"my deal is  :%@",deal);
        
        ///for(int j = 0; j < [deal count]; j++){
        statesDataModel *DataModel = [[statesDataModel alloc] init];
        DataModel.state_id                = [deal valueForKey:@"id"];
        DataModel.name             = [deal valueForKey:@"name"];
        DataModel.state_code              = [deal valueForKey:@"state_code"];
        DataModel.slug           = [deal valueForKey:@"slug"];
        DataModel.shipping_charge               =[deal valueForKey:@"shipping_charge"];
    
        
        
        [dealsDataArray addObject:DataModel];
        // }
    }
    
    return dealsDataArray;
}


/*
-(void)setDataforOffline:(NSArray *)array{
 
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
   
    for(int i=0;i<array.count;i++){
        NSManagedObject *newContact;
        newContact = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Jokes"
                      inManagedObjectContext:context];
        DealsDataModel *model =[array objectAtIndex:i];
        NSLog(@"model:%@",model);
        NSLog(@"id:%@",model.dealsId);
        NSLog(@"des:%@",model.Description);
    [newContact setValue: model.dealsId forKey:@"id"];
    [newContact setValue: model.Description forKey:@"des"];
    [newContact setValue: model.imageURL forKey:@"image"];
        NSError *error;
        
        [context save:&error];
    }
 

}
-(NSArray*)fetchDataFromCoreData{
    AppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];//Get it from AppDelegate
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Jokes"];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if (error != nil) {
        
        //Deal with failure
    }
    else {
        
        //Deal with successre
        NSLog(@"fetch data are:%@",results);
    }
    return results;
} */
@end
