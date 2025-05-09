alter table raw_coffee_survey rename column "Submission ID" to submission_id;
alter table raw_coffee_survey rename column "What is your age?" to age;
alter table raw_coffee_survey rename column "How many cups of coffee do you typically drink per day?" to daily_coffee_cups;
alter table raw_coffee_survey rename column "Where do you typically drink coffee?" to coffee_drink_location;
alter table raw_coffee_survey rename column "Where do you typically drink coffee? (At home)" to coffee_drink_location_home;
alter table raw_coffee_survey rename column "Where do you typically drink coffee? (At the office)" to coffee_drink_location_office
;
alter table raw_coffee_survey rename column "Where do you typically drink coffee? (On the go)" to coffee_drink_location_on_the_go
;
alter table raw_coffee_survey rename column "Where do you typically drink coffee? (At a cafe)" to coffee_drink_location_cafe;
alter table raw_coffee_survey rename column "Where do you typically drink coffee? (None of these)" to coffee_drink_location_none
;
alter table raw_coffee_survey rename column "How do you brew coffee at home?" to home_brew_method;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Pour over)" to home_brew_pour_over;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (French press)" to home_brew_french_press;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Espresso)" to home_brew_espresso;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Coffee brewing machine (e.g. M" to home_brew_machine
;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Pod/capsule machine (e.g. Keur" to home_brew_pod
;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Instant coffee)" to home_brew_instant;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Bean-to-cup machine)" to home_brew_bean_to_cup;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Cold brew)" to home_brew_cold_brew;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Coffee extract (e.g. Cometeer)" to home_brew_extract
;
alter table raw_coffee_survey rename column "How do you brew coffee at home? (Other)" to home_brew_other;
alter table raw_coffee_survey rename column "How else do you brew coffee at home?" to additional_home_brew_methods;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee?" to purchase_location_on_the_go
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (National ch" to purchase_location_national_chain
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (Local cafe)" to purchase_location_local_cafe
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (Drive-thru)" to purchase_location_drive_thru
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (Specialty c" to purchase_location_specialty_shop
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (Deli or sup" to purchase_location_deli_supermarket
;
alter table raw_coffee_survey rename column "On the go, where do you typically purchase coffee? (Other)" to purchase_location_other
;
alter table raw_coffee_survey rename column "Where else do you purchase coffee?" to additional_purchase_locations;
alter table raw_coffee_survey rename column "What is your favorite coffee drink?" to favorite_coffee_drink;
alter table raw_coffee_survey rename column "Please specify what your favorite coffee drink is" to favorite_drink_specify;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee?" to additions_to_coffee;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee? (No - just black)" to add_black;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee? (Milk, dairy altern" to add_milk;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee? (Sugar or sweetener" to add_sugar;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee? (Flavor syrup)" to add_flavor_syrup;
alter table raw_coffee_survey rename column "Do you usually add anything to your coffee? (Other)" to add_other;
alter table raw_coffee_survey rename column "What else do you add to your coffee?" to additional_additions;
alter table raw_coffee_survey rename column "What kind of dairy do you add?" to dairy_type;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Whole milk)" to dairy_whole_milk;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Skim milk)" to dairy_skim_milk;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Half and half)" to dairy_half_and_half;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Coffee creamer)" to dairy_creamer;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Flavored coffee creamer)" to dairy_flavored_creamer
;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Oat milk)" to dairy_oat_milk;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Almond milk)" to dairy_almond_milk;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Soy milk)" to dairy_soy_milk;
alter table raw_coffee_survey rename column "What kind of dairy do you add? (Other)" to dairy_other;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add?" to sweetener_type;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Granulated Sugar)" to sweetener_granulated_sugar
;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Artificial Sweeten" to sweetener_artificial
;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Honey)" to sweetener_honey;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Maple Syrup)" to sweetener_maple_syrup
;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Stevia)" to sweetener_stevia;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Agave Nectar)" to sweetener_agave;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Brown Sugar)" to sweetener_brown_sugar
;
alter table raw_coffee_survey rename column "What kind of sugar or sweetener do you add? (Raw Sugar (Turbina" to sweetener_raw_sugar
;
alter table raw_coffee_survey rename column "What kind of flavorings do you add?" to flavoring_type;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Vanilla Syrup)" to flavoring_vanilla;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Caramel Syrup)" to flavoring_caramel;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Hazelnut Syrup)" to flavoring_hazelnut;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Cinnamon (Ground or Stick)" to flavoring_cinnamon
;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Peppermint Syrup)" to flavoring_peppermint;
alter table raw_coffee_survey rename column "What kind of flavorings do you add? (Other)" to flavoring_other;
alter table raw_coffee_survey rename column "What other flavoring do you use?" to additional_flavorings;
alter table raw_coffee_survey rename column "Before today's tasting, which of the following best described w" to coffee_preference_description
;
alter table raw_coffee_survey rename column "How strong do you like your coffee?" to coffee_strength;
alter table raw_coffee_survey rename column "What roast level of coffee do you prefer?" to coffee_roast_preference;
alter table raw_coffee_survey rename column "How much caffeine do you like in your coffee?" to caffeine_preference;
alter table raw_coffee_survey rename column "Lastly, how would you rate your own coffee expertise?" to self_rated_expertise;
alter table raw_coffee_survey rename column "Coffee A - Bitterness" to coffee_a_bitterness;
alter table raw_coffee_survey rename column "Coffee A - Acidity" to coffee_a_acidity;
alter table raw_coffee_survey rename column "Coffee A - Personal Preference" to coffee_a_preference;
alter table raw_coffee_survey rename column "Coffee A - Notes" to coffee_a_notes;
alter table raw_coffee_survey rename column "Coffee B - Bitterness" to coffee_b_bitterness;
alter table raw_coffee_survey rename column "Coffee B - Acidity" to coffee_b_acidity;
alter table raw_coffee_survey rename column "Coffee B - Personal Preference" to coffee_b_preference;
alter table raw_coffee_survey rename column "Coffee B - Notes" to coffee_b_notes;
alter table raw_coffee_survey rename column "Coffee C - Bitterness" to coffee_c_bitterness;
alter table raw_coffee_survey rename column "Coffee C - Acidity" to coffee_c_acidity;
alter table raw_coffee_survey rename column "Coffee C - Personal Preference" to coffee_c_preference;
alter table raw_coffee_survey rename column "Coffee C - Notes" to coffee_c_notes;
alter table raw_coffee_survey rename column "Coffee D - Bitterness" to coffee_d_bitterness;
alter table raw_coffee_survey rename column "Coffee D - Acidity" to coffee_d_acidity;
alter table raw_coffee_survey rename column "Coffee D - Personal Preference" to coffee_d_preference;
alter table raw_coffee_survey rename column "Coffee D - Notes" to coffee_d_notes;
alter table raw_coffee_survey rename column "Between Coffee A, Coffee B, and Coffee C which did you prefer?" to preferred_coffee_abc
;
alter table raw_coffee_survey rename column "Between Coffee A and Coffee D, which did you prefer?" to preferred_coffee_ad;
alter table raw_coffee_survey rename column "Lastly, what was your favorite overall coffee?" to favorite_overall_coffee;
alter table raw_coffee_survey rename column "Do you work from home or in person?" to work_location;
alter table raw_coffee_survey rename column "In total, much money do you typically spend on coffee in a mont" to monthly_coffee_spending
;
alter table raw_coffee_survey rename column "Why do you drink coffee?" to reason_for_drinking_coffee;
alter table raw_coffee_survey rename column "Why do you drink coffee? (It tastes good)" to reason_tastes_good;
alter table raw_coffee_survey rename column "Why do you drink coffee? (I need the caffeine)" to reason_caffeine;
alter table raw_coffee_survey rename column "Why do you drink coffee? (I need the ritual)" to reason_ritual;
alter table raw_coffee_survey rename column "Why do you drink coffee? (It makes me go to the bathroom)" to reason_bathroom;
alter table raw_coffee_survey rename column "Why do you drink coffee? (Other)" to reason_other;
alter table raw_coffee_survey rename column "Other reason for drinking coffee" to additional_reasons;
alter table raw_coffee_survey rename column "Do you like the taste of coffee?" to likes_coffee_taste;
alter table raw_coffee_survey rename column "Do you know where your coffee comes from?" to knows_coffee_origin;
alter table raw_coffee_survey rename column "What is the most you've ever paid for a cup of coffee?" to max_paid_for_coffee;
alter table raw_coffee_survey rename column "What is the most you'd ever be willing to pay for a cup of coff" to willing_to_pay_for_coffee
;
alter table raw_coffee_survey rename column "Do you feel like you’re getting good value for your money whe" to perceived_value_cafe
;
alter table raw_coffee_survey rename column "Approximately how much have you spent on coffee equipment in the past 5 years?" to
coffee_equipment_spending;
alter table raw_coffee_survey rename column "Do you feel like you’re getting good value for your money with regards to your coffee equipment?"
to perceived_value_equipment;
alter table raw_coffee_survey rename column "Gender" to gender;
alter table raw_coffee_survey rename column "Gender (please specify)" to gender_specify;
alter table raw_coffee_survey rename column "Education Level" to education_level;
alter table raw_coffee_survey rename column "Ethnicity/Race" to ethnicity;
alter table raw_coffee_survey rename column "Ethnicity/Race (please specify)" to ethnicity_specify;
alter table raw_coffee_survey rename column "Employment Status" to employment_status;
alter table raw_coffee_survey rename column "Number of Children" to number_of_children;
alter table raw_coffee_survey rename column "Political Affiliation" to political_affiliation;