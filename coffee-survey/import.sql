-- 1. Drop table if it already exists
DROP TABLE IF EXISTS raw_coffee_survey;

-- 2. Create table with inferred structure from the CSV
CREATE TABLE raw_coffee_survey (
    submission_id TEXT,
    age TEXT,
    cups TEXT,
    where_drink TEXT,
    brew TEXT,
    brew_other TEXT,
    purchase TEXT,
    purchase_other TEXT,
    favorite TEXT,
    favorite_specify TEXT,
    additions TEXT,
    additions_other TEXT,
    dairy TEXT,
    sweetener TEXT,
    style TEXT,
    strength TEXT,
    roast_level TEXT,
    caffeine TEXT,
    expertise TEXT,
    coffee_a_bitterness TEXT,
    coffee_a_acidity TEXT,
    coffee_a_personal_preference TEXT,
    coffee_a_notes TEXT,
    coffee_b_bitterness TEXT,
    coffee_b_acidity TEXT,
    coffee_b_personal_preference TEXT,
    coffee_b_notes TEXT,
    coffee_c_bitterness TEXT,
    coffee_c_acidity TEXT,
    coffee_c_personal_preference TEXT,
    coffee_c_notes TEXT,
    coffee_d_bitterness TEXT,
    coffee_d_acidity TEXT,
    coffee_d_personal_preference TEXT,
    coffee_d_notes TEXT,
    prefer_abc TEXT,
    prefer_ad TEXT,
    prefer_overall TEXT,
    wfh TEXT,
    total_spend TEXT,
    why_drink TEXT,
    why_drink_other TEXT,
    taste TEXT,
    know_source TEXT,
    most_paid TEXT,
    most_willing TEXT,
    value_cafe TEXT,
    spent_equipment TEXT,
    value_equipment TEXT,
    gender TEXT,
    gender_specify TEXT,
    education_level TEXT,
    ethnicity_race TEXT,
    ethnicity_race_specify TEXT,
    employment_status TEXT,
    number_children TEXT,
    political_affiliation TEXT
);

-- 3. Import data using COPY
-- Make sure the file is accessible to the PostgreSQL server and the path is correct.
COPY raw_coffee_survey
FROM '/Users/ivanivani/Documents/PYTHON/Projects/sql-portfolio/coffee-survey/coffee_survey.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    NULL '',
    ENCODING 'UTF8'
);
