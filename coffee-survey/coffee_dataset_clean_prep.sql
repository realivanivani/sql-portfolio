/*
The following is my SQL data cleaning project for
https://github.com/realivanivani/sql-portfolio/blob/main/coffee-survey/GACTT_RESULTS_ANONYMIZED_v2.csv

Author: Ivan Ivani
https://realivanivani.github.io/
*/

-- Create staging table
CREATE TABLE coffee_survey_staging (LIKE raw_coffee_survey INCLUDING ALL);

SELECT * FROM coffee_survey_staging;

INSERT INTO coffee_survey_staging
SELECT *
FROM raw_coffee_survey;



-- Alter table to have correct data types for each column
/* 
On data import, I had to read all columns as text first because
the original csv has abnormally long column names since it was structured from
a survey. So, I thought I should alter columns to their relevant data types
during the cleaning process instead. The following query may improve storage/memory
performance because TEXT columns & fields typically index slower and tend to be larger
respectively. 
 */
ALTER TABLE coffee_survey_staging
ALTER COLUMN submission_id TYPE VARCHAR(255),
ALTER COLUMN age TYPE VARCHAR(255),
ALTER COLUMN favorite_coffee_drink TYPE VARCHAR(255),
ALTER COLUMN coffee_preference_description TYPE VARCHAR(255),
ALTER COLUMN coffee_strength TYPE VARCHAR(255),
ALTER COLUMN coffee_roast_preference TYPE VARCHAR(255),
ALTER COLUMN caffeine_preference TYPE VARCHAR(255),
ALTER COLUMN preferred_coffee_abc TYPE VARCHAR(255),
ALTER COLUMN preferred_coffee_ad TYPE VARCHAR(255),
ALTER COLUMN favorite_overall_coffee TYPE VARCHAR(255),
ALTER COLUMN work_location TYPE VARCHAR(255),
ALTER COLUMN monthly_coffee_spending TYPE VARCHAR(255),
ALTER COLUMN max_paid_for_coffee TYPE VARCHAR(255),
ALTER COLUMN willing_to_pay_for_coffee TYPE VARCHAR(255),
ALTER COLUMN coffee_equipment_spending TYPE VARCHAR(255),
ALTER COLUMN gender TYPE VARCHAR(255),
ALTER COLUMN gender_specify TYPE VARCHAR(255),
ALTER COLUMN education_level TYPE VARCHAR(255),
ALTER COLUMN ethnicity TYPE VARCHAR(255),
ALTER COLUMN employment_status TYPE VARCHAR(255),
ALTER COLUMN political_affiliation TYPE VARCHAR(255),
ALTER COLUMN additional_home_brew_methods TYPE TEXT,
ALTER COLUMN additional_purchase_locations TYPE TEXT,
ALTER COLUMN favorite_drink_specify TYPE TEXT,
ALTER COLUMN additional_additions TYPE TEXT,
ALTER COLUMN coffee_a_notes TYPE TEXT,
ALTER COLUMN coffee_b_notes TYPE TEXT,
ALTER COLUMN coffee_c_notes TYPE TEXT,
ALTER COLUMN coffee_d_notes TYPE TEXT,
ALTER COLUMN additional_reasons TYPE TEXT,
ALTER COLUMN ethnicity_specify TYPE TEXT;

-- Convert text numbers to int numbers; NULLs to nulls
UPDATE coffee_survey_staging
SET self_rated_expertise = CASE WHEN self_rated_expertise = '' OR self_rated_expertise IS NULL THEN NULL ELSE self_rated_expertise END,
    coffee_a_bitterness = CASE WHEN coffee_a_bitterness = '' OR coffee_a_bitterness IS NULL THEN NULL ELSE coffee_a_bitterness END,
    coffee_a_acidity = CASE WHEN coffee_a_acidity = '' OR coffee_a_acidity IS NULL THEN NULL ELSE coffee_a_acidity END,
    coffee_a_preference = CASE WHEN coffee_a_preference = '' OR coffee_a_preference IS NULL THEN NULL ELSE coffee_a_preference END,
    coffee_b_bitterness = CASE WHEN coffee_b_bitterness = '' OR coffee_b_bitterness IS NULL THEN NULL ELSE coffee_b_bitterness END,
    coffee_b_acidity = CASE WHEN coffee_b_acidity = '' OR coffee_b_acidity IS NULL THEN NULL ELSE coffee_b_acidity END,
    coffee_b_preference = CASE WHEN coffee_b_preference = '' OR coffee_b_preference IS NULL THEN NULL ELSE coffee_b_preference END,
    coffee_c_bitterness = CASE WHEN coffee_c_bitterness = '' OR coffee_c_bitterness IS NULL THEN NULL ELSE coffee_c_bitterness END,
    coffee_c_acidity = CASE WHEN coffee_c_acidity = '' OR coffee_c_acidity IS NULL THEN NULL ELSE coffee_c_acidity END,
    coffee_c_preference = CASE WHEN coffee_c_preference = '' OR coffee_c_preference IS NULL THEN NULL ELSE coffee_c_preference END,
    coffee_d_bitterness = CASE WHEN coffee_d_bitterness = '' OR coffee_d_bitterness IS NULL THEN NULL ELSE coffee_d_bitterness END,
    coffee_d_acidity = CASE WHEN coffee_d_acidity = '' OR coffee_d_acidity IS NULL THEN NULL ELSE coffee_d_acidity END,
    coffee_d_preference = CASE WHEN coffee_d_preference = '' OR coffee_d_preference IS NULL THEN NULL ELSE coffee_d_preference END;

-- Alter column types for future EDA
ALTER TABLE coffee_survey_staging
ALTER COLUMN self_rated_expertise TYPE INT USING self_rated_expertise::decimal,
ALTER COLUMN coffee_a_bitterness TYPE INT USING coffee_a_bitterness::decimal,
ALTER COLUMN coffee_a_acidity TYPE INT USING coffee_a_acidity::decimal,
ALTER COLUMN coffee_a_preference TYPE INT USING coffee_a_preference::decimal,
ALTER COLUMN coffee_b_bitterness TYPE INT USING coffee_b_bitterness::decimal,
ALTER COLUMN coffee_b_acidity TYPE INT USING coffee_b_acidity::decimal,
ALTER COLUMN coffee_b_preference TYPE INT USING coffee_b_preference::decimal,
ALTER COLUMN coffee_c_bitterness TYPE INT USING coffee_c_bitterness::decimal,
ALTER COLUMN coffee_c_acidity TYPE INT USING coffee_c_acidity::decimal,
ALTER COLUMN coffee_c_preference TYPE INT USING coffee_c_preference::decimal,
ALTER COLUMN coffee_d_bitterness TYPE INT USING coffee_d_bitterness::decimal,
ALTER COLUMN coffee_d_acidity TYPE INT USING coffee_d_acidity::decimal,
ALTER COLUMN coffee_d_preference TYPE INT USING coffee_d_preference::decimal;

-- Convert 'TRUE'/'FALSE' or 'Yes'/'No' strings to actual boolean values ; handle NULLs
UPDATE coffee_survey_staging
SET 
    coffee_drink_location_home = CASE WHEN coffee_drink_location_home = 'TRUE' THEN TRUE WHEN coffee_drink_location_home = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_office = CASE WHEN coffee_drink_location_office = 'TRUE' THEN TRUE WHEN coffee_drink_location_office = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_on_the_go = CASE WHEN coffee_drink_location_on_the_go = 'TRUE' THEN TRUE WHEN coffee_drink_location_on_the_go = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_cafe = CASE WHEN coffee_drink_location_cafe = 'TRUE' THEN TRUE WHEN coffee_drink_location_cafe = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_none = CASE WHEN coffee_drink_location_none = 'TRUE' THEN TRUE WHEN coffee_drink_location_none = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_pour_over = CASE WHEN home_brew_pour_over = 'TRUE' THEN TRUE WHEN home_brew_pour_over = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_french_press = CASE WHEN home_brew_french_press = 'TRUE' THEN TRUE WHEN home_brew_french_press = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_espresso = CASE WHEN home_brew_espresso = 'TRUE' THEN TRUE WHEN home_brew_espresso = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_machine = CASE WHEN home_brew_machine = 'TRUE' THEN TRUE WHEN home_brew_machine = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_pod = CASE WHEN home_brew_pod = 'TRUE' THEN TRUE WHEN home_brew_pod = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_instant = CASE WHEN home_brew_instant = 'TRUE' THEN TRUE WHEN home_brew_instant = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_bean_to_cup = CASE WHEN home_brew_bean_to_cup = 'TRUE' THEN TRUE WHEN home_brew_bean_to_cup = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_cold_brew = CASE WHEN home_brew_cold_brew = 'TRUE' THEN TRUE WHEN home_brew_cold_brew = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_extract = CASE WHEN home_brew_extract = 'TRUE' THEN TRUE WHEN home_brew_extract = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_other = CASE WHEN home_brew_other = 'TRUE' THEN TRUE WHEN home_brew_other = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_on_the_go = CASE WHEN purchase_location_on_the_go = 'TRUE' THEN TRUE WHEN purchase_location_on_the_go = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_national_chain = CASE WHEN purchase_location_national_chain = 'TRUE' THEN TRUE WHEN purchase_location_national_chain = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_local_cafe = CASE WHEN purchase_location_local_cafe = 'TRUE' THEN TRUE WHEN purchase_location_local_cafe = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_drive_thru = CASE WHEN purchase_location_drive_thru = 'TRUE' THEN TRUE WHEN purchase_location_drive_thru = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_specialty_shop = CASE WHEN purchase_location_specialty_shop = 'TRUE' THEN TRUE WHEN purchase_location_specialty_shop = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_deli_supermarket = CASE WHEN purchase_location_deli_supermarket = 'TRUE' THEN TRUE WHEN purchase_location_deli_supermarket = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_other = CASE WHEN purchase_location_other = 'TRUE' THEN TRUE WHEN purchase_location_other = 'FALSE' THEN FALSE ELSE NULL END,
    add_black = CASE WHEN add_black = 'TRUE' THEN TRUE WHEN add_black = 'FALSE' THEN FALSE ELSE NULL END,
    add_milk = CASE WHEN add_milk = 'TRUE' THEN TRUE WHEN add_milk = 'FALSE' THEN FALSE ELSE NULL END,
    add_sugar = CASE WHEN add_sugar = 'TRUE' THEN TRUE WHEN add_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    add_flavor_syrup = CASE WHEN add_flavor_syrup = 'TRUE' THEN TRUE WHEN add_flavor_syrup = 'FALSE' THEN FALSE ELSE NULL END,
    add_other = CASE WHEN add_other = 'TRUE' THEN TRUE WHEN add_other = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_whole_milk = CASE WHEN dairy_whole_milk = 'TRUE' THEN TRUE WHEN dairy_whole_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_skim_milk = CASE WHEN dairy_skim_milk = 'TRUE' THEN TRUE WHEN dairy_skim_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_half_and_half = CASE WHEN dairy_half_and_half = 'TRUE' THEN TRUE WHEN dairy_half_and_half = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_creamer = CASE WHEN dairy_creamer = 'TRUE' THEN TRUE WHEN dairy_creamer = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_flavored_creamer = CASE WHEN dairy_flavored_creamer = 'TRUE' THEN TRUE WHEN dairy_flavored_creamer = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_oat_milk = CASE WHEN dairy_oat_milk = 'TRUE' THEN TRUE WHEN dairy_oat_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_almond_milk = CASE WHEN dairy_almond_milk = 'TRUE' THEN TRUE WHEN dairy_almond_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_soy_milk = CASE WHEN dairy_soy_milk = 'TRUE' THEN TRUE WHEN dairy_soy_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_other = CASE WHEN dairy_other = 'TRUE' THEN TRUE WHEN dairy_other = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_granulated_sugar = CASE WHEN sweetener_granulated_sugar = 'TRUE' THEN TRUE WHEN sweetener_granulated_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_artificial = CASE WHEN sweetener_artificial = 'TRUE' THEN TRUE WHEN sweetener_artificial = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_honey = CASE WHEN sweetener_honey = 'TRUE' THEN TRUE WHEN sweetener_honey = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_maple_syrup = CASE WHEN sweetener_maple_syrup = 'TRUE' THEN TRUE WHEN sweetener_maple_syrup = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_stevia = CASE WHEN sweetener_stevia = 'TRUE' THEN TRUE WHEN sweetener_stevia = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_agave = CASE WHEN sweetener_agave = 'TRUE' THEN TRUE WHEN sweetener_agave = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_brown_sugar = CASE WHEN sweetener_brown_sugar = 'TRUE' THEN TRUE WHEN sweetener_brown_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_raw_sugar = CASE WHEN sweetener_raw_sugar = 'TRUE' THEN TRUE WHEN sweetener_raw_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    reason_tastes_good = CASE WHEN reason_tastes_good = 'TRUE' THEN TRUE WHEN reason_tastes_good = 'FALSE' THEN FALSE ELSE NULL END,
    reason_caffeine = CASE WHEN reason_caffeine = 'TRUE' THEN TRUE WHEN reason_caffeine = 'FALSE' THEN FALSE ELSE NULL END,
    reason_ritual = CASE WHEN reason_ritual = 'TRUE' THEN TRUE WHEN reason_ritual = 'FALSE' THEN FALSE ELSE NULL END,
    reason_bathroom = CASE WHEN reason_bathroom = 'TRUE' THEN TRUE WHEN reason_bathroom = 'FALSE' THEN FALSE ELSE NULL END,
    reason_other = CASE WHEN reason_other = 'TRUE' THEN TRUE WHEN reason_other = 'FALSE' THEN FALSE ELSE NULL END,
    likes_coffee_taste = CASE WHEN likes_coffee_taste = 'Yes' THEN TRUE WHEN likes_coffee_taste = 'No' THEN FALSE ELSE NULL END,
    knows_coffee_origin = CASE WHEN knows_coffee_origin = 'Yes' THEN TRUE WHEN knows_coffee_origin = 'No' THEN FALSE ELSE NULL END,
    perceived_value_cafe = CASE WHEN perceived_value_cafe = 'Yes' THEN TRUE WHEN perceived_value_cafe = 'No' THEN FALSE ELSE NULL END,
    perceived_value_equipment = CASE WHEN perceived_value_equipment = 'Yes' THEN TRUE WHEN perceived_value_equipment = 'No' THEN FALSE ELSE NULL END;

-- Alter column types to BOOLEAN
ALTER TABLE coffee_survey_staging
ALTER COLUMN coffee_drink_location_home TYPE BOOLEAN USING coffee_drink_location_home::boolean,
ALTER COLUMN coffee_drink_location_office TYPE BOOLEAN USING coffee_drink_location_office::boolean,
ALTER COLUMN coffee_drink_location_on_the_go TYPE BOOLEAN USING coffee_drink_location_on_the_go::boolean,
ALTER COLUMN coffee_drink_location_cafe TYPE BOOLEAN USING coffee_drink_location_cafe::boolean,
ALTER COLUMN coffee_drink_location_none TYPE BOOLEAN USING coffee_drink_location_none::boolean,
ALTER COLUMN home_brew_pour_over TYPE BOOLEAN USING home_brew_pour_over::boolean,
ALTER COLUMN home_brew_french_press TYPE BOOLEAN USING home_brew_french_press::boolean,
ALTER COLUMN home_brew_espresso TYPE BOOLEAN USING home_brew_espresso::boolean,
ALTER COLUMN home_brew_machine TYPE BOOLEAN USING home_brew_machine::boolean,
ALTER COLUMN home_brew_pod TYPE BOOLEAN USING home_brew_pod::boolean,
ALTER COLUMN home_brew_instant TYPE BOOLEAN USING home_brew_instant::boolean,
ALTER COLUMN home_brew_bean_to_cup TYPE BOOLEAN USING home_brew_bean_to_cup::boolean,
ALTER COLUMN home_brew_cold_brew TYPE BOOLEAN USING home_brew_cold_brew::boolean,
ALTER COLUMN home_brew_extract TYPE BOOLEAN USING home_brew_extract::boolean,
ALTER COLUMN home_brew_other TYPE BOOLEAN USING home_brew_other::boolean,
ALTER COLUMN purchase_location_on_the_go TYPE BOOLEAN USING purchase_location_on_the_go::boolean,
ALTER COLUMN purchase_location_national_chain TYPE BOOLEAN USING purchase_location_national_chain::boolean,
ALTER COLUMN purchase_location_local_cafe TYPE BOOLEAN USING purchase_location_local_cafe::boolean,
ALTER COLUMN purchase_location_drive_thru TYPE BOOLEAN USING purchase_location_drive_thru::boolean,
ALTER COLUMN purchase_location_specialty_shop TYPE BOOLEAN USING purchase_location_specialty_shop::boolean,
ALTER COLUMN purchase_location_deli_supermarket TYPE BOOLEAN USING purchase_location_deli_supermarket::boolean,
ALTER COLUMN purchase_location_other TYPE BOOLEAN USING purchase_location_other::boolean,
ALTER COLUMN add_black TYPE BOOLEAN USING add_black::boolean,
ALTER COLUMN add_milk TYPE BOOLEAN USING add_milk::boolean,
ALTER COLUMN add_sugar TYPE BOOLEAN USING add_sugar::boolean,
ALTER COLUMN add_flavor_syrup TYPE BOOLEAN USING add_flavor_syrup::boolean,
ALTER COLUMN add_other TYPE BOOLEAN USING add_other::boolean,
ALTER COLUMN dairy_whole_milk TYPE BOOLEAN USING dairy_whole_milk::boolean,
ALTER COLUMN dairy_skim_milk TYPE BOOLEAN USING dairy_skim_milk::boolean,
ALTER COLUMN dairy_half_and_half TYPE BOOLEAN USING dairy_half_and_half::boolean,
ALTER COLUMN dairy_creamer TYPE BOOLEAN USING dairy_creamer::boolean,
ALTER COLUMN dairy_flavored_creamer TYPE BOOLEAN USING dairy_flavored_creamer::boolean,
ALTER COLUMN dairy_oat_milk TYPE BOOLEAN USING dairy_oat_milk::boolean,
ALTER COLUMN dairy_almond_milk TYPE BOOLEAN USING dairy_almond_milk::boolean,
ALTER COLUMN dairy_soy_milk TYPE BOOLEAN USING dairy_soy_milk::boolean,
ALTER COLUMN dairy_other TYPE BOOLEAN USING dairy_other::boolean,
ALTER COLUMN sweetener_granulated_sugar TYPE BOOLEAN USING sweetener_granulated_sugar::boolean,
ALTER COLUMN sweetener_artificial TYPE BOOLEAN USING sweetener_artificial::boolean,
ALTER COLUMN sweetener_honey TYPE BOOLEAN USING sweetener_honey::boolean,
ALTER COLUMN sweetener_maple_syrup TYPE BOOLEAN USING sweetener_maple_syrup::boolean,
ALTER COLUMN sweetener_stevia TYPE BOOLEAN USING sweetener_stevia::boolean,
ALTER COLUMN sweetener_agave TYPE BOOLEAN USING sweetener_agave::boolean,
ALTER COLUMN sweetener_brown_sugar TYPE BOOLEAN USING sweetener_brown_sugar::boolean,
ALTER COLUMN sweetener_raw_sugar TYPE BOOLEAN USING sweetener_raw_sugar::boolean,
ALTER COLUMN reason_tastes_good TYPE BOOLEAN USING reason_tastes_good::boolean,
ALTER COLUMN reason_caffeine TYPE BOOLEAN USING reason_caffeine::boolean,
ALTER COLUMN reason_ritual TYPE BOOLEAN USING reason_ritual::boolean,
ALTER COLUMN reason_bathroom TYPE BOOLEAN USING reason_bathroom::boolean,
ALTER COLUMN reason_other TYPE BOOLEAN USING reason_other::boolean,
ALTER COLUMN likes_coffee_taste TYPE BOOLEAN USING likes_coffee_taste::boolean,
ALTER COLUMN knows_coffee_origin TYPE BOOLEAN USING knows_coffee_origin::boolean,
ALTER COLUMN perceived_value_cafe TYPE BOOLEAN USING perceived_value_cafe::boolean,
ALTER COLUMN perceived_value_equipment TYPE BOOLEAN USING perceived_value_equipment::boolean;

-- We can also drop columns that seem redundant/not useful in EDA/empty
ALTER TABLE coffee_survey_staging -- here to next; redundant summary of ff bool cols
DROP COLUMN purchase_location_on_the_go,
DROP COLUMN coffee_drink_location,
DROP COLUMN home_brew_method,
DROP COLUMN additions_to_coffee,
DROP COLUMN dairy_type,
DROP COLUMN sweetener_type,
DROP COLUMN reason_for_drinking_coffee,
DROP COLUMN flavoring_type,-- here onwards, empty columns
DROP COLUMN flavoring_vanilla,
DROP COLUMN flavoring_caramel,
DROP COLUMN flavoring_hazelnut,
DROP COLUMN flavoring_cinnamon,
DROP COLUMN flavoring_peppermint,
DROP COLUMN flavoring_other,
DROP COLUMN additional_flavorings;

-- Time to review column values

-- Review

SELECT *
FROM coffee_survey_staging;

-- entries validation
SELECT DISTINCT COUNT(submission_id)
FROM coffee_survey_staging;
-- correct number of entries, seems to be no duplicates if based on submission_id


-- Remove line break \r (carriage return[Enter]) from data import
SELECT *
FROM coffee_survey_staging;

SELECT political_affiliation
FROM coffee_survey_staging
WHERE political_affiliation LIKE '%\r'
;

UPDATE coffee_survey_staging
SET political_affiliation = REPLACE(political_affiliation,'\r','')
;
SELECT political_affiliation
FROM coffee_survey_staging;


-- set null as NULL
UPDATE coffee_survey_staging
SET 
    age = CASE WHEN age = '' THEN NULL ELSE age END,
    favorite_coffee_drink = CASE WHEN favorite_coffee_drink = '' THEN NULL ELSE favorite_coffee_drink END,
    additional_purchase_locations = CASE WHEN additional_purchase_locations = '' THEN NULL ELSE additional_purchase_locations END,
    additional_home_brew_methods = CASE WHEN additional_home_brew_methods = '' THEN NULL ELSE additional_home_brew_methods END,
    favorite_drink_specify = CASE WHEN favorite_drink_specify = '' THEN NULL ELSE favorite_drink_specify END,
    additional_additions = CASE WHEN additional_additions = '' THEN NULL ELSE additional_additions END,
    coffee_preference_description = CASE WHEN coffee_preference_description = '' THEN NULL ELSE coffee_preference_description END,
    coffee_strength = CASE WHEN coffee_strength = '' THEN NULL ELSE coffee_strength END,
    coffee_roast_preference = CASE WHEN coffee_roast_preference = '' THEN NULL ELSE coffee_roast_preference END,
    caffeine_preference = CASE WHEN caffeine_preference = '' THEN NULL ELSE caffeine_preference END,
    coffee_a_notes = CASE WHEN coffee_a_notes = '' THEN NULL ELSE coffee_a_notes END,
    coffee_b_notes = CASE WHEN coffee_b_notes = '' THEN NULL ELSE coffee_b_notes END,
    coffee_c_notes = CASE WHEN coffee_c_notes = '' THEN NULL ELSE coffee_c_notes END,
    coffee_d_notes = CASE WHEN coffee_d_notes = '' THEN NULL ELSE coffee_d_notes END,
    preferred_coffee_abc = CASE WHEN preferred_coffee_abc = '' THEN NULL ELSE preferred_coffee_abc END,
    preferred_coffee_ad = CASE WHEN preferred_coffee_ad = '' THEN NULL ELSE preferred_coffee_ad END,
    favorite_overall_coffee = CASE WHEN favorite_overall_coffee = '' THEN NULL ELSE favorite_overall_coffee END,
    work_location = CASE WHEN work_location = '' THEN NULL ELSE work_location END,
    monthly_coffee_spending = CASE WHEN monthly_coffee_spending = '' THEN NULL ELSE monthly_coffee_spending END,
    additional_reasons = CASE WHEN additional_reasons = '' THEN NULL ELSE additional_reasons END,
    max_paid_for_coffee = CASE WHEN max_paid_for_coffee = '' THEN NULL ELSE max_paid_for_coffee END,
    willing_to_pay_for_coffee = CASE WHEN willing_to_pay_for_coffee = '' THEN NULL ELSE willing_to_pay_for_coffee END,
    coffee_equipment_spending = CASE WHEN coffee_equipment_spending = '' THEN NULL ELSE coffee_equipment_spending END,
    gender = CASE WHEN gender = '' THEN NULL ELSE gender END,
    gender_specify = CASE WHEN gender_specify = '' THEN NULL ELSE gender_specify END,
    education_level = CASE WHEN education_level = '' THEN NULL ELSE education_level END,
    ethnicity = CASE WHEN ethnicity = '' THEN NULL ELSE ethnicity END,
    ethnicity_specify = CASE WHEN ethnicity_specify = '' THEN NULL ELSE ethnicity_specify END,
    employment_status = CASE WHEN employment_status = '' THEN NULL ELSE employment_status END,
    number_of_children = CASE WHEN number_of_children = '' THEN NULL ELSE number_of_children END,
    political_affiliation = CASE WHEN political_affiliation = '' THEN NULL ELSE political_affiliation END;

-- daily cups
SELECT DISTINCT daily_coffee_cups
FROM coffee_survey_staging
ORDER BY daily_coffee_cups; -- Might be useful for EDA. best set to INT

-- Add a temporary column
ALTER TABLE coffee_survey_staging ADD COLUMN daily_coffee_cups_cleaned INT;

-- Update the temporary column with cleaned values
UPDATE coffee_survey_staging
SET daily_coffee_cups_cleaned = CASE
    WHEN daily_coffee_cups = 'More than 4' THEN 5
    /* made the executive decision to set this as 5. I would ask first what
    value to set this to normally, but for now lets set 5 as the catchall for >4 */
    WHEN daily_coffee_cups = 'Less than 1' THEN 0 -- might as well count as 0
    WHEN daily_coffee_cups = '1' THEN 1
    WHEN daily_coffee_cups = '2' THEN 2
    WHEN daily_coffee_cups = '3' THEN 3
    WHEN daily_coffee_cups = '4' THEN 4
    ELSE NULL -- Handle unexpected values if any
END;

-- Copy the cleaned values back to the original column
UPDATE coffee_survey_staging
SET daily_coffee_cups = daily_coffee_cups_cleaned;

-- Drop the temporary column
ALTER TABLE coffee_survey_staging DROP COLUMN daily_coffee_cups_cleaned;

-- Ensure the original column is set to INT
ALTER TABLE coffee_survey_staging
ALTER COLUMN daily_coffee_cups TYPE INT USING daily_coffee_cups::decimal;


-- None children -> 0 ; same as above
SELECT DISTINCT number_of_children
FROM coffee_survey_staging
ORDER BY number_of_children -- Again, might be useful for EDA. Need INT
;

-- Add a temporary column
ALTER TABLE coffee_survey_staging ADD COLUMN number_of_children_cleaned INT;

-- Update the temporary column with cleaned values
UPDATE coffee_survey_staging
SET number_of_children_cleaned = CASE
    WHEN number_of_children = 'More than 3' THEN 4
    /* same thought process as daily cups of coffee */
    WHEN number_of_children = 'None' THEN 0
    WHEN number_of_children = '1' THEN 1
    WHEN number_of_children = '2' THEN 2
    WHEN number_of_children = '3' THEN 3
    ELSE NULL -- Handle unexpected values if any
END;

-- Copy the cleaned values back to the original column
UPDATE coffee_survey_staging
SET number_of_children = number_of_children_cleaned;

-- Drop the temporary column
ALTER TABLE coffee_survey_staging DROP COLUMN number_of_children_cleaned;

-- Ensure the original column is set to INT
ALTER TABLE coffee_survey_staging
ALTER COLUMN number_of_children TYPE INT USING number_of_children::decimal;


-- Simplify more columns; standardize >/< values

UPDATE coffee_survey_staging
SET age = REPLACE(age, ' years old', '');

UPDATE coffee_survey_staging
SET max_paid_for_coffee = REPLACE(max_paid_for_coffee, 'More than ', '>');

UPDATE coffee_survey_staging
SET max_paid_for_coffee = REPLACE(max_paid_for_coffee, 'Less than ', '<');

UPDATE coffee_survey_staging
SET willing_to_pay_for_coffee = REPLACE(willing_to_pay_for_coffee, 'More than ', '>');

UPDATE coffee_survey_staging
SET willing_to_pay_for_coffee = REPLACE(willing_to_pay_for_coffee, 'Less than ', '<');

UPDATE coffee_survey_staging
SET coffee_equipment_spending = REPLACE(coffee_equipment_spending, 'More than ', '>');

UPDATE coffee_survey_staging
SET coffee_equipment_spending = REPLACE(coffee_equipment_spending, 'Less than ', '<');

-- 2nd Look through; final reviews
SELECT DISTINCT *
FROM coffee_survey_staging;


ALTER TABLE coffee_survey_staging
ALTER COLUMN submission_id TYPE VARCHAR(255),
ALTER COLUMN age TYPE VARCHAR(255),
ALTER COLUMN favorite_coffee_drink TYPE VARCHAR(255),
ALTER COLUMN coffee_preference_description TYPE VARCHAR(255),
ALTER COLUMN coffee_strength TYPE VARCHAR(255),
ALTER COLUMN coffee_roast_preference TYPE VARCHAR(255),
ALTER COLUMN caffeine_preference TYPE VARCHAR(255),
ALTER COLUMN preferred_coffee_abc TYPE VARCHAR(255),
ALTER COLUMN preferred_coffee_ad TYPE VARCHAR(255),
ALTER COLUMN favorite_overall_coffee TYPE VARCHAR(255),
ALTER COLUMN work_location TYPE VARCHAR(255),
ALTER COLUMN monthly_coffee_spending TYPE VARCHAR(255),
ALTER COLUMN max_paid_for_coffee TYPE VARCHAR(255),
ALTER COLUMN willing_to_pay_for_coffee TYPE VARCHAR(255),
ALTER COLUMN coffee_equipment_spending TYPE VARCHAR(255),
ALTER COLUMN gender TYPE VARCHAR(255),
ALTER COLUMN gender_specify TYPE VARCHAR(255),
ALTER COLUMN education_level TYPE VARCHAR(255),
ALTER COLUMN ethnicity TYPE VARCHAR(255),
ALTER COLUMN employment_status TYPE VARCHAR(255),
ALTER COLUMN political_affiliation TYPE VARCHAR(255),
ALTER COLUMN additional_home_brew_methods TYPE TEXT,
ALTER COLUMN additional_purchase_locations TYPE TEXT,
ALTER COLUMN favorite_drink_specify TYPE TEXT,
ALTER COLUMN additional_additions TYPE TEXT,
ALTER COLUMN coffee_a_notes TYPE TEXT,
ALTER COLUMN coffee_b_notes TYPE TEXT,
ALTER COLUMN coffee_c_notes TYPE TEXT,
ALTER COLUMN coffee_d_notes TYPE TEXT,
ALTER COLUMN additional_reasons TYPE TEXT,
ALTER COLUMN ethnicity_specify TYPE TEXT;

-- Convert text numbers to int numbers; NULLs to nulls
UPDATE coffee_survey_staging
SET self_rated_expertise = CASE WHEN self_rated_expertise = '' OR self_rated_expertise IS NULL THEN NULL ELSE self_rated_expertise END,
    coffee_a_bitterness = CASE WHEN coffee_a_bitterness = '' OR coffee_a_bitterness IS NULL THEN NULL ELSE coffee_a_bitterness END,
    coffee_a_acidity = CASE WHEN coffee_a_acidity = '' OR coffee_a_acidity IS NULL THEN NULL ELSE coffee_a_acidity END,
    coffee_a_preference = CASE WHEN coffee_a_preference = '' OR coffee_a_preference IS NULL THEN NULL ELSE coffee_a_preference END,
    coffee_b_bitterness = CASE WHEN coffee_b_bitterness = '' OR coffee_b_bitterness IS NULL THEN NULL ELSE coffee_b_bitterness END,
    coffee_b_acidity = CASE WHEN coffee_b_acidity = '' OR coffee_b_acidity IS NULL THEN NULL ELSE coffee_b_acidity END,
    coffee_b_preference = CASE WHEN coffee_b_preference = '' OR coffee_b_preference IS NULL THEN NULL ELSE coffee_b_preference END,
    coffee_c_bitterness = CASE WHEN coffee_c_bitterness = '' OR coffee_c_bitterness IS NULL THEN NULL ELSE coffee_c_bitterness END,
    coffee_c_acidity = CASE WHEN coffee_c_acidity = '' OR coffee_c_acidity IS NULL THEN NULL ELSE coffee_c_acidity END,
    coffee_c_preference = CASE WHEN coffee_c_preference = '' OR coffee_c_preference IS NULL THEN NULL ELSE coffee_c_preference END,
    coffee_d_bitterness = CASE WHEN coffee_d_bitterness = '' OR coffee_d_bitterness IS NULL THEN NULL ELSE coffee_d_bitterness END,
    coffee_d_acidity = CASE WHEN coffee_d_acidity = '' OR coffee_d_acidity IS NULL THEN NULL ELSE coffee_d_acidity END,
    coffee_d_preference = CASE WHEN coffee_d_preference = '' OR coffee_d_preference IS NULL THEN NULL ELSE coffee_d_preference END;

-- Alter column types for future EDA
ALTER TABLE coffee_survey_staging
ALTER COLUMN self_rated_expertise TYPE INT USING self_rated_expertise::decimal,
ALTER COLUMN coffee_a_bitterness TYPE INT USING coffee_a_bitterness::decimal,
ALTER COLUMN coffee_a_acidity TYPE INT USING coffee_a_acidity::decimal,
ALTER COLUMN coffee_a_preference TYPE INT USING coffee_a_preference::decimal,
ALTER COLUMN coffee_b_bitterness TYPE INT USING coffee_b_bitterness::decimal,
ALTER COLUMN coffee_b_acidity TYPE INT USING coffee_b_acidity::decimal,
ALTER COLUMN coffee_b_preference TYPE INT USING coffee_b_preference::decimal,
ALTER COLUMN coffee_c_bitterness TYPE INT USING coffee_c_bitterness::decimal,
ALTER COLUMN coffee_c_acidity TYPE INT USING coffee_c_acidity::decimal,
ALTER COLUMN coffee_c_preference TYPE INT USING coffee_c_preference::decimal,
ALTER COLUMN coffee_d_bitterness TYPE INT USING coffee_d_bitterness::decimal,
ALTER COLUMN coffee_d_acidity TYPE INT USING coffee_d_acidity::decimal,
ALTER COLUMN coffee_d_preference TYPE INT USING coffee_d_preference::decimal;

-- Convert 'TRUE'/'FALSE' or 'Yes'/'No' strings to actual boolean values ; handle NULLs
UPDATE coffee_survey_staging
SET 
    coffee_drink_location_home = CASE WHEN coffee_drink_location_home = 'TRUE' THEN TRUE WHEN coffee_drink_location_home = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_office = CASE WHEN coffee_drink_location_office = 'TRUE' THEN TRUE WHEN coffee_drink_location_office = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_on_the_go = CASE WHEN coffee_drink_location_on_the_go = 'TRUE' THEN TRUE WHEN coffee_drink_location_on_the_go = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_cafe = CASE WHEN coffee_drink_location_cafe = 'TRUE' THEN TRUE WHEN coffee_drink_location_cafe = 'FALSE' THEN FALSE ELSE NULL END,
    coffee_drink_location_none = CASE WHEN coffee_drink_location_none = 'TRUE' THEN TRUE WHEN coffee_drink_location_none = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_pour_over = CASE WHEN home_brew_pour_over = 'TRUE' THEN TRUE WHEN home_brew_pour_over = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_french_press = CASE WHEN home_brew_french_press = 'TRUE' THEN TRUE WHEN home_brew_french_press = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_espresso = CASE WHEN home_brew_espresso = 'TRUE' THEN TRUE WHEN home_brew_espresso = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_machine = CASE WHEN home_brew_machine = 'TRUE' THEN TRUE WHEN home_brew_machine = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_pod = CASE WHEN home_brew_pod = 'TRUE' THEN TRUE WHEN home_brew_pod = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_instant = CASE WHEN home_brew_instant = 'TRUE' THEN TRUE WHEN home_brew_instant = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_bean_to_cup = CASE WHEN home_brew_bean_to_cup = 'TRUE' THEN TRUE WHEN home_brew_bean_to_cup = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_cold_brew = CASE WHEN home_brew_cold_brew = 'TRUE' THEN TRUE WHEN home_brew_cold_brew = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_extract = CASE WHEN home_brew_extract = 'TRUE' THEN TRUE WHEN home_brew_extract = 'FALSE' THEN FALSE ELSE NULL END,
    home_brew_other = CASE WHEN home_brew_other = 'TRUE' THEN TRUE WHEN home_brew_other = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_on_the_go = CASE WHEN purchase_location_on_the_go = 'TRUE' THEN TRUE WHEN purchase_location_on_the_go = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_national_chain = CASE WHEN purchase_location_national_chain = 'TRUE' THEN TRUE WHEN purchase_location_national_chain = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_local_cafe = CASE WHEN purchase_location_local_cafe = 'TRUE' THEN TRUE WHEN purchase_location_local_cafe = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_drive_thru = CASE WHEN purchase_location_drive_thru = 'TRUE' THEN TRUE WHEN purchase_location_drive_thru = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_specialty_shop = CASE WHEN purchase_location_specialty_shop = 'TRUE' THEN TRUE WHEN purchase_location_specialty_shop = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_deli_supermarket = CASE WHEN purchase_location_deli_supermarket = 'TRUE' THEN TRUE WHEN purchase_location_deli_supermarket = 'FALSE' THEN FALSE ELSE NULL END,
    purchase_location_other = CASE WHEN purchase_location_other = 'TRUE' THEN TRUE WHEN purchase_location_other = 'FALSE' THEN FALSE ELSE NULL END,
    add_black = CASE WHEN add_black = 'TRUE' THEN TRUE WHEN add_black = 'FALSE' THEN FALSE ELSE NULL END,
    add_milk = CASE WHEN add_milk = 'TRUE' THEN TRUE WHEN add_milk = 'FALSE' THEN FALSE ELSE NULL END,
    add_sugar = CASE WHEN add_sugar = 'TRUE' THEN TRUE WHEN add_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    add_flavor_syrup = CASE WHEN add_flavor_syrup = 'TRUE' THEN TRUE WHEN add_flavor_syrup = 'FALSE' THEN FALSE ELSE NULL END,
    add_other = CASE WHEN add_other = 'TRUE' THEN TRUE WHEN add_other = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_whole_milk = CASE WHEN dairy_whole_milk = 'TRUE' THEN TRUE WHEN dairy_whole_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_skim_milk = CASE WHEN dairy_skim_milk = 'TRUE' THEN TRUE WHEN dairy_skim_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_half_and_half = CASE WHEN dairy_half_and_half = 'TRUE' THEN TRUE WHEN dairy_half_and_half = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_creamer = CASE WHEN dairy_creamer = 'TRUE' THEN TRUE WHEN dairy_creamer = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_flavored_creamer = CASE WHEN dairy_flavored_creamer = 'TRUE' THEN TRUE WHEN dairy_flavored_creamer = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_oat_milk = CASE WHEN dairy_oat_milk = 'TRUE' THEN TRUE WHEN dairy_oat_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_almond_milk = CASE WHEN dairy_almond_milk = 'TRUE' THEN TRUE WHEN dairy_almond_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_soy_milk = CASE WHEN dairy_soy_milk = 'TRUE' THEN TRUE WHEN dairy_soy_milk = 'FALSE' THEN FALSE ELSE NULL END,
    dairy_other = CASE WHEN dairy_other = 'TRUE' THEN TRUE WHEN dairy_other = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_granulated_sugar = CASE WHEN sweetener_granulated_sugar = 'TRUE' THEN TRUE WHEN sweetener_granulated_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_artificial = CASE WHEN sweetener_artificial = 'TRUE' THEN TRUE WHEN sweetener_artificial = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_honey = CASE WHEN sweetener_honey = 'TRUE' THEN TRUE WHEN sweetener_honey = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_maple_syrup = CASE WHEN sweetener_maple_syrup = 'TRUE' THEN TRUE WHEN sweetener_maple_syrup = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_stevia = CASE WHEN sweetener_stevia = 'TRUE' THEN TRUE WHEN sweetener_stevia = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_agave = CASE WHEN sweetener_agave = 'TRUE' THEN TRUE WHEN sweetener_agave = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_brown_sugar = CASE WHEN sweetener_brown_sugar = 'TRUE' THEN TRUE WHEN sweetener_brown_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    sweetener_raw_sugar = CASE WHEN sweetener_raw_sugar = 'TRUE' THEN TRUE WHEN sweetener_raw_sugar = 'FALSE' THEN FALSE ELSE NULL END,
    reason_tastes_good = CASE WHEN reason_tastes_good = 'TRUE' THEN TRUE WHEN reason_tastes_good = 'FALSE' THEN FALSE ELSE NULL END,
    reason_caffeine = CASE WHEN reason_caffeine = 'TRUE' THEN TRUE WHEN reason_caffeine = 'FALSE' THEN FALSE ELSE NULL END,
    reason_ritual = CASE WHEN reason_ritual = 'TRUE' THEN TRUE WHEN reason_ritual = 'FALSE' THEN FALSE ELSE NULL END,
    reason_bathroom = CASE WHEN reason_bathroom = 'TRUE' THEN TRUE WHEN reason_bathroom = 'FALSE' THEN FALSE ELSE NULL END,
    reason_other = CASE WHEN reason_other = 'TRUE' THEN TRUE WHEN reason_other = 'FALSE' THEN FALSE ELSE NULL END,
    likes_coffee_taste = CASE WHEN likes_coffee_taste = 'Yes' THEN TRUE WHEN likes_coffee_taste = 'No' THEN FALSE ELSE NULL END,
    knows_coffee_origin = CASE WHEN knows_coffee_origin = 'Yes' THEN TRUE WHEN knows_coffee_origin = 'No' THEN FALSE ELSE NULL END,
    perceived_value_cafe = CASE WHEN perceived_value_cafe = 'Yes' THEN TRUE WHEN perceived_value_cafe = 'No' THEN FALSE ELSE NULL END,
    perceived_value_equipment = CASE WHEN perceived_value_equipment = 'Yes' THEN TRUE WHEN perceived_value_equipment = 'No' THEN FALSE ELSE NULL END;

-- Alter column types to BOOLEAN
ALTER TABLE coffee_survey_staging
ALTER COLUMN coffee_drink_location_home TYPE BOOLEAN,
ALTER COLUMN coffee_drink_location_office TYPE BOOLEAN,
ALTER COLUMN coffee_drink_location_on_the_go TYPE BOOLEAN,
ALTER COLUMN coffee_drink_location_cafe TYPE BOOLEAN,
ALTER COLUMN coffee_drink_location_none TYPE BOOLEAN,
ALTER COLUMN home_brew_pour_over TYPE BOOLEAN,
ALTER COLUMN home_brew_french_press TYPE BOOLEAN,
ALTER COLUMN home_brew_espresso TYPE BOOLEAN,
ALTER COLUMN home_brew_machine TYPE BOOLEAN,
ALTER COLUMN home_brew_pod TYPE BOOLEAN,
ALTER COLUMN home_brew_instant TYPE BOOLEAN,
ALTER COLUMN home_brew_bean_to_cup TYPE BOOLEAN,
ALTER COLUMN home_brew_cold_brew TYPE BOOLEAN,
ALTER COLUMN home_brew_extract TYPE BOOLEAN,
ALTER COLUMN home_brew_other TYPE BOOLEAN,
ALTER COLUMN purchase_location_on_the_go TYPE BOOLEAN,
ALTER COLUMN purchase_location_national_chain TYPE BOOLEAN,
ALTER COLUMN purchase_location_local_cafe TYPE BOOLEAN,
ALTER COLUMN purchase_location_drive_thru TYPE BOOLEAN,
ALTER COLUMN purchase_location_specialty_shop TYPE BOOLEAN,
ALTER COLUMN purchase_location_deli_supermarket TYPE BOOLEAN,
ALTER COLUMN purchase_location_other TYPE BOOLEAN,
ALTER COLUMN add_black TYPE BOOLEAN,
ALTER COLUMN add_milk TYPE BOOLEAN,
ALTER COLUMN add_sugar TYPE BOOLEAN,
ALTER COLUMN add_flavor_syrup TYPE BOOLEAN,
ALTER COLUMN add_other TYPE BOOLEAN,
ALTER COLUMN dairy_whole_milk TYPE BOOLEAN,
ALTER COLUMN dairy_skim_milk TYPE BOOLEAN,
ALTER COLUMN dairy_half_and_half TYPE BOOLEAN,
ALTER COLUMN dairy_creamer TYPE BOOLEAN,
ALTER COLUMN dairy_flavored_creamer TYPE BOOLEAN,
ALTER COLUMN dairy_oat_milk TYPE BOOLEAN,
ALTER COLUMN dairy_almond_milk TYPE BOOLEAN,
ALTER COLUMN dairy_soy_milk TYPE BOOLEAN,
ALTER COLUMN dairy_other TYPE BOOLEAN,
ALTER COLUMN sweetener_granulated_sugar TYPE BOOLEAN,
ALTER COLUMN sweetener_artificial TYPE BOOLEAN,
ALTER COLUMN sweetener_honey TYPE BOOLEAN,
ALTER COLUMN sweetener_maple_syrup TYPE BOOLEAN,
ALTER COLUMN sweetener_stevia TYPE BOOLEAN,
ALTER COLUMN sweetener_agave TYPE BOOLEAN,
ALTER COLUMN sweetener_brown_sugar TYPE BOOLEAN,
ALTER COLUMN sweetener_raw_sugar TYPE BOOLEAN,
ALTER COLUMN reason_tastes_good TYPE BOOLEAN,
ALTER COLUMN reason_caffeine TYPE BOOLEAN,
ALTER COLUMN reason_ritual TYPE BOOLEAN,
ALTER COLUMN reason_bathroom TYPE BOOLEAN,
ALTER COLUMN reason_other TYPE BOOLEAN,
ALTER COLUMN likes_coffee_taste TYPE BOOLEAN,
ALTER COLUMN knows_coffee_origin TYPE BOOLEAN,
ALTER COLUMN perceived_value_cafe TYPE BOOLEAN,
ALTER COLUMN perceived_value_equipment TYPE BOOLEAN;

-- We can also drop columns that seem redundant/not useful in EDA/empty
ALTER TABLE coffee_survey_staging -- here to next; redundant summary of ff bool cols
DROP COLUMN purchase_location_on_the_go,
DROP COLUMN coffee_drink_location,
DROP COLUMN home_brew_method,
DROP COLUMN additions_to_coffee,
DROP COLUMN dairy_type,
DROP COLUMN sweetener_type,
DROP COLUMN reason_for_drinking_coffee,
DROP COLUMN flavoring_type,-- here onwards, empty columns
DROP COLUMN flavoring_vanilla,
DROP COLUMN flavoring_caramel,
DROP COLUMN flavoring_hazelnut,
DROP COLUMN flavoring_cinnamon,
DROP COLUMN flavoring_peppermint,
DROP COLUMN flavoring_other,
DROP COLUMN additional_flavorings;

-- Time to review column values

-- Review

SELECT *
FROM coffee_survey_staging;

-- entries validation
SELECT COUNT(DISTINCT submission_id)
FROM coffee_survey_staging;
-- correct number of entries, seems to be no duplicates if based on submission_id

-- Remove line break \r (carriage return[Enter]) from data import
SELECT *
FROM coffee_survey_staging;

SELECT political_affiliation
FROM coffee_survey_staging
WHERE political_affiliation LIKE '%\r'
;

UPDATE coffee_survey_staging
SET political_affiliation = REPLACE(political_affiliation,'\r','')
;

SELECT political_affiliation
FROM coffee_survey_staging;

-- set null as NULL
UPDATE coffee_survey_staging
SET 
    age = CASE WHEN age = '' THEN NULL ELSE age END,
    favorite_coffee_drink = CASE WHEN favorite_coffee_drink = '' THEN NULL ELSE favorite_coffee_drink END,
    additional_purchase_locations = CASE WHEN additional_purchase_locations = '' THEN NULL ELSE additional_purchase_locations END,
    additional_home_brew_methods = CASE WHEN additional_home_brew_methods = '' THEN NULL ELSE additional_home_brew_methods END,
    favorite_drink_specify = CASE WHEN favorite_drink_specify = '' THEN NULL ELSE favorite_drink_specify END,
    additional_additions = CASE WHEN additional_additions = '' THEN NULL ELSE additional_additions END,
    coffee_preference_description = CASE WHEN coffee_preference_description = '' THEN NULL ELSE coffee_preference_description END,
    coffee_strength = CASE WHEN coffee_strength = '' THEN NULL ELSE coffee_strength END,
    coffee_roast_preference = CASE WHEN coffee_roast_preference = '' THEN NULL ELSE coffee_roast_preference END,
    caffeine_preference = CASE WHEN caffeine_preference = '' THEN NULL ELSE caffeine_preference END,
    coffee_a_notes = CASE WHEN coffee_a_notes = '' THEN NULL ELSE coffee_a_notes END,
    coffee_b_notes = CASE WHEN coffee_b_notes = '' THEN NULL ELSE coffee_b_notes END,
    coffee_c_notes = CASE WHEN coffee_c_notes = '' THEN NULL ELSE coffee_c_notes END,
    coffee_d_notes = CASE WHEN coffee_d_notes = '' THEN NULL ELSE coffee_d_notes END,
    preferred_coffee_abc = CASE WHEN preferred_coffee_abc = '' THEN NULL ELSE preferred_coffee_abc END,
    preferred_coffee_ad = CASE WHEN preferred_coffee_ad = '' THEN NULL ELSE preferred_coffee_ad END,
    favorite_overall_coffee = CASE WHEN favorite_overall_coffee = '' THEN NULL ELSE favorite_overall_coffee END,
    work_location = CASE WHEN work_location = '' THEN NULL ELSE work_location END,
    monthly_coffee_spending = CASE WHEN monthly_coffee_spending = '' THEN NULL ELSE monthly_coffee_spending END,
    additional_reasons = CASE WHEN additional_reasons = '' THEN NULL ELSE additional_reasons END,
    max_paid_for_coffee = CASE WHEN max_paid_for_coffee = '' THEN NULL ELSE max_paid_for_coffee END,
    willing_to_pay_for_coffee = CASE WHEN willing_to_pay_for_coffee = '' THEN NULL ELSE willing_to_pay_for_coffee END,
    coffee_equipment_spending = CASE WHEN coffee_equipment_spending = '' THEN NULL ELSE coffee_equipment_spending END,
    gender = CASE WHEN gender = '' THEN NULL ELSE gender END,
    gender_specify = CASE WHEN gender_specify = '' THEN NULL ELSE gender_specify END,
    education_level = CASE WHEN education_level = '' THEN NULL ELSE education_level END,
    ethnicity = CASE WHEN ethnicity = '' THEN NULL ELSE ethnicity END,
    ethnicity_specify = CASE WHEN ethnicity_specify = '' THEN NULL ELSE ethnicity_specify END,
    employment_status = CASE WHEN employment_status = '' THEN NULL ELSE employment_status END,
    number_of_children = CASE WHEN number_of_children = '' THEN NULL ELSE number_of_children END,
    political_affiliation = CASE WHEN political_affiliation = '' THEN NULL ELSE political_affiliation END;

-- daily cups
SELECT DISTINCT daily_coffee_cups
FROM coffee_survey_staging
ORDER BY daily_coffee_cups; -- Might be useful for EDA. best set to INT

-- Add a temporary column
ALTER TABLE coffee_survey_staging ADD COLUMN daily_coffee_cups_cleaned INT;

-- Update the temporary column with cleaned values
UPDATE coffee_survey_staging
SET daily_coffee_cups_cleaned = CASE
    WHEN daily_coffee_cups = 'More than 4' THEN 5
    /* made the executive decision to set this as 5. I would ask first what
    value to set this to normally, but for now lets set 5 as the catchall for >4 */
    WHEN daily_coffee_cups = 'Less than 1' THEN 0 -- might as well count as 0
    WHEN daily_coffee_cups = '1' THEN 1
    WHEN daily_coffee_cups = '2' THEN 2
    WHEN daily_coffee_cups = '3' THEN 3
    WHEN daily_coffee_cups = '4' THEN 4
    ELSE NULL -- Handle unexpected values if any
END;

-- Copy the cleaned values back to the original column
UPDATE coffee_survey_staging
SET daily_coffee_cups = daily_coffee_cups_cleaned;

-- Drop the temporary column
ALTER TABLE coffee_survey_staging DROP COLUMN daily_coffee_cups_cleaned;

-- Ensure the original column is set to INT
ALTER TABLE coffee_survey_staging
ALTER COLUMN daily_coffee_cups TYPE INT;

-- None children -> 0 ; same as above
SELECT DISTINCT number_of_children
FROM coffee_survey_staging
ORDER BY number_of_children -- Again, might be useful for EDA. Need INT
;

-- Add a temporary column
ALTER TABLE coffee_survey_staging ADD COLUMN number_of_children_cleaned INT;

-- Update the temporary column with cleaned values
UPDATE coffee_survey_staging
SET number_of_children_cleaned = CASE
    WHEN number_of_children = 'More than 3' THEN 4
    /* same thought process as daily cups of coffee */
    WHEN number_of_children = 'None' THEN 0
    WHEN number_of_children = '1' THEN 1
    WHEN number_of_children = '2' THEN 2
    WHEN number_of_children = '3' THEN 3
    ELSE NULL -- Handle unexpected values if any
END;

-- Copy the cleaned values back to the original column
UPDATE coffee_survey_staging
SET number_of_children = number_of_children_cleaned;

-- Drop the temporary column
ALTER TABLE coffee_survey_staging DROP COLUMN number_of_children_cleaned;

-- Ensure the original column is set to INT
ALTER TABLE coffee_survey_staging
ALTER COLUMN number_of_children TYPE INT;

-- Simplify more columns; standardize >/< values

UPDATE coffee_survey_staging
SET age = REPLACE(age, ' years old', '');

UPDATE coffee_survey_staging
SET max_paid_for_coffee = REPLACE(max_paid_for_coffee, 'More than ', '>');

UPDATE coffee_survey_staging
SET max_paid_for_coffee = REPLACE(max_paid_for_coffee, 'Less than ', '<');

UPDATE coffee_survey_staging
SET willing_to_pay_for_coffee = REPLACE(willing_to_pay_for_coffee, 'More than ', '>');

UPDATE coffee_survey_staging
SET willing_to_pay_for_coffee = REPLACE(willing_to_pay_for_coffee, 'Less than ', '<');

UPDATE coffee_survey_staging
SET coffee_equipment_spending = REPLACE(coffee_equipment_spending, 'More than ', '>');

UPDATE coffee_survey_staging
SET coffee_equipment_spending = REPLACE(coffee_equipment_spending, 'Less than ', '<');

-- 2nd Look through; final reviews
SELECT DISTINCT *
FROM coffee_survey_staging;