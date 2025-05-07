/*
The following is my SQL data cleaning project for
https://github.com/rfordatascience/tidytuesday/blob/master/data/2024/2024-05-14/readme.md#coffee_surveycsv

Author: Ivan Ivani
https://realivanivani.github.io/
*/

create table cleaned_coffee_survey
   as
      select
    -- Standardized and cleaned frequency
       case
         when lower(trim(q1_how_often_do_you_drink_coffee)) in ( 'once a day',
                                                                 'once per day' ) then
            'once_per_day'
         when lower(trim(q1_how_often_do_you_drink_coffee)) = 'several times a day' then
            'multiple_per_day'
         when lower(trim(q1_how_often_do_you_drink_coffee)) = 'once a week'         then
            'once_per_week'
         when lower(trim(q1_how_often_do_you_drink_coffee)) = 'a few times a week'  then
            'few_per_week'
         else
            'unknown'
             end as coffee_frequency,

    -- Brew method, standardized
             lower(replace(
                trim(q2_how_do_you_brew_your_coffee),
                ' ',
                '_'
             )) as brew_method,

    -- Favorite coffee type
             coalesce(
                lower(replace(
                   trim(q6_favorite_coffee_type),
                   ' ',
                   '_'
                )),
                'unknown'
             ) as favorite_coffee_type,

    -- Age as integer and age bins
             try_cast(q3_age as int) as age,
             case
                when try_cast(q3_age as int) < 18              then
                   'under_18'
                when try_cast(q3_age as int) between 18 and 24 then
                   '18_24'
                when try_cast(q3_age as int) between 25 and 34 then
                   '25_34'
                when try_cast(q3_age as int) between 35 and 44 then
                   '35_44'
                when try_cast(q3_age as int) between 45 and 54 then
                   '45_54'
                when try_cast(q3_age as int) >= 55             then
                   '55_plus'
                else
                   'unknown'
             end as age_group,

    -- Gender normalized
             case
                when lower(trim(q4_gender)) in ( 'male',
                                                 'm' ) then
                   'male'
                when lower(trim(q4_gender)) in ( 'female',
                                                 'f' ) then
                   'female'
                else
                   'other_or_unknown'
             end as gender,

    -- Country standardized
             case
                when lower(trim(q5_country)) in ( 'us',
                                                  'usa',
                                                  'united states' ) then
                   'united_states'
                when lower(trim(q5_country)) in ( 'uk',
                                                  'england',
                                                  'great britain',
                                                  'united kingdom' ) then
                   'united_kingdom'
                else
                   lower(replace(
                      trim(q5_country),
                      ' ',
                      '_'
                   ))
             end as country,

    -- Flag: frequent drinker
             case
                when lower(trim(q1_how_often_do_you_drink_coffee)) in ( 'several times a day',
                                                                        'once a day',
                                                                        'once per day' ) then
                   1
                else
                   0
             end as is_frequent_drinker,

    -- Optional field missing flag
             q6_favorite_coffee_type is null as missing_favorite_type
        from raw_coffee_survey
       where q1_how_often_do_you_drink_coffee is not null
         and try_cast(q3_age as int) is not null;