--  FINANCE INVESTMENT SURVEY - Complete PostgreSQL Script
--  Student Mini Project | Data Science
--  Dataset: 40 investors, 24 columns
 
 
-- PART 1: CLEAN START
-- Drop old tables and views if they exist
 

DROP VIEW IF EXISTS agegroup_behavior;
DROP VIEW IF EXISTS avenue_gender_summary;
DROP VIEW IF EXISTS investor_summary;
DROP TABLE IF EXISTS investment_ratings;
DROP TABLE IF EXISTS investors;



-- PART 2: CREATE TABLES


-- Table 1: investors
-- Stores personal details and investment preferences of each person

CREATE TABLE investors (
    investor_id       SERIAL PRIMARY KEY,
    gender            VARCHAR(10),
    age               INT,
    age_group         VARCHAR(10) GENERATED ALWAYS AS (
                          CASE
                              WHEN age BETWEEN 21 AND 25 THEN '21-25'
                              WHEN age BETWEEN 26 AND 30 THEN '26-30'
                              ELSE '31-35'
                          END
                      ) STORED,
    invests_in_avenues VARCHAR(5),
    stock_market      VARCHAR(5),
    factor            VARCHAR(30),
    objective         VARCHAR(30),
    purpose           VARCHAR(30),
    duration          VARCHAR(20),
    invest_monitor    VARCHAR(10),
    expect            VARCHAR(10),
    preferred_avenue  VARCHAR(30),
    savings_objective VARCHAR(50),
    reason_equity     VARCHAR(30),
    reason_mutual     VARCHAR(30),
    reason_bonds      VARCHAR(30),
    reason_fd         VARCHAR(30),
    info_source       VARCHAR(40)
);

-- Table 2: investment_ratings
-- Stores how each investor ranked 7 investment types (1=best, 7=worst)

CREATE TABLE investment_ratings (
    rating_id        SERIAL PRIMARY KEY,
    investor_id      INT REFERENCES investors(investor_id) ON DELETE CASCADE,
    mutual_funds     INT,
    equity_market    INT,
    debentures       INT,
    government_bonds INT,
    fixed_deposits   INT,
    ppf              INT,
    gold             INT
);



-- PART 3: INSERT DATA - investors table
-- All 40 investors from the dataset


INSERT INTO investors (
    gender, age, invests_in_avenues, stock_market, factor,
    objective, purpose, duration, invest_monitor, expect,
    preferred_avenue, savings_objective, reason_equity,
    reason_mutual, reason_bonds, reason_fd, info_source
)
VALUES
  ('Female', 34, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Safe Investment', 'Fixed Returns', 'Newspapers and Magazines'),
  ('Female', 23, 'Yes', 'No', 'Locking Period', 'Capital Appreciation', 'Wealth Creation', 'More than 5 years', 'Weekly', '20%-30%', 'Mutual Fund', 'Health Care', 'Dividend', 'Better Returns', 'Safe Investment', 'High Interest Rates', 'Financial Consultants'),
  ('Male', 30, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Daily', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Tax Benefits', 'Assured Returns', 'Fixed Returns', 'Television'),
  ('Male', 22, 'Yes', 'Yes', 'Returns', 'Income', 'Wealth Creation', 'Less than 1 year', 'Daily', '10%-20%', 'Equity', 'Retirement Plan', 'Dividend', 'Fund Diversification', 'Tax Incentives', 'High Interest Rates', 'Internet'),
  ('Female', 24, 'No', 'No', 'Returns', 'Income', 'Wealth Creation', 'Less than 1 year', 'Daily', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Safe Investment', 'Risk Free', 'Internet'),
  ('Female', 24, 'No', 'No', 'Risk', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Daily', '30%-40%', 'Mutual Fund', 'Retirement Plan', 'Liquidity', 'Fund Diversification', 'Safe Investment', 'Risk Free', 'Internet'),
  ('Female', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'High Interest Rates', 'Financial Consultants'),
  ('Male', 21, 'Yes', 'Yes', 'Risk', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 35, 'Yes', 'Yes', 'Returns', 'Growth', 'Savings for Future', '1-3 years', 'Weekly', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Fund Diversification', 'Safe Investment', 'Fixed Returns', 'Television'),
  ('Male', 31, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '30%-40%', 'Fixed Deposits', 'Retirement Plan', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Fixed Returns', 'Newspapers and Magazines'),
  ('Female', 35, 'Yes', 'Yes', 'Risk', 'Growth', 'Savings for Future', '3-5 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Financial Consultants'),
  ('Male', 29, 'Yes', 'Yes', 'Risk', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Female', 21, 'No', 'No', 'Returns', 'Capital Appreciation', 'Savings for Future', '1-3 years', 'Weekly', '20%-30%', 'Mutual Fund', 'Education', 'Dividend', 'Better Returns', 'Safe Investment', 'Risk Free', 'Internet'),
  ('Female', 28, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Female', 25, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Health Care', 'Dividend', 'Better Returns', 'Assured Returns', 'Risk Free', 'Financial Consultants'),
  ('Male', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Health Care', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Female', 28, 'Yes', 'Yes', 'Risk', 'Growth', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Health Care', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Risk Free', 'Television'),
  ('Male', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Financial Consultants'),
  ('Male', 29, 'Yes', 'Yes', 'Risk', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 26, 'Yes', 'Yes', 'Risk', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Health Care', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 29, 'Yes', 'Yes', 'Returns', 'Growth', 'Wealth Creation', '3-5 years', 'Weekly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Female', 24, 'Yes', 'Yes', 'Risk', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Equity', 'Health Care', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Financial Consultants'),
  ('Male', 25, 'Yes', 'Yes', 'Risk', 'Growth', 'Savings for Future', '3-5 years', 'Weekly', '20%-30%', 'Public Provident Fund', 'Health Care', 'Liquidity', 'Better Returns', 'Assured Returns', 'Risk Free', 'Financial Consultants'),
  ('Female', 26, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '30%-40%', 'Public Provident Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Female', 32, 'Yes', 'Yes', 'Risk', 'Growth', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 26, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Mutual Fund', 'Retirement Plan', 'Dividend', 'Fund Diversification', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 31, 'Yes', 'Yes', 'Risk', 'Growth', 'Savings for Future', '1-3 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Health Care', 'Capital Appreciation', 'Fund Diversification', 'Safe Investment', 'Fixed Returns', 'Television'),
  ('Male', 29, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Television'),
  ('Female', 34, 'Yes', 'Yes', 'Returns', 'Income', 'Returns', '3-5 years', 'Monthly', '10%-20%', 'Mutual Fund', 'Retirement Plan', 'Capital Appreciation', 'Tax Benefits', 'Safe Investment', 'Fixed Returns', 'Newspapers and Magazines'),
  ('Male', 27, 'Yes', 'No', 'Returns', 'Growth', 'Wealth Creation', '1-3 years', 'Monthly', '10%-20%', 'Mutual Fund', 'Education', 'Capital Appreciation', 'Tax Benefits', 'Safe Investment', 'Fixed Returns', 'Television'),
  ('Female', 31, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '30%-40%', 'Equity', 'Health Care', 'Capital Appreciation', 'Fund Diversification', 'Assured Returns', 'Fixed Returns', 'Newspapers and Magazines'),
  ('Male', 26, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Returns', '1-3 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Education', 'Dividend', 'Better Returns', 'Safe Investment', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 27, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Weekly', '20%-30%', 'Mutual Fund', 'Health Care', 'Capital Appreciation', 'Better Returns', 'Safe Investment', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 30, 'Yes', 'Yes', 'Risk', 'Growth', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Health Care', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 30, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '1-3 years', 'Monthly', '20%-30%', 'Equity', 'Retirement Plan', 'Capital Appreciation', 'Better Returns', 'Assured Returns', 'Risk Free', 'Newspapers and Magazines'),
  ('Male', 25, 'Yes', 'Yes', 'Risk', 'Growth', 'Savings for Future', '3-5 years', 'Monthly', '30%-40%', 'Public Provident Fund', 'Health Care', 'Capital Appreciation', 'Better Returns', 'Safe Investment', 'Fixed Returns', 'Financial Consultants'),
  ('Male', 31, 'Yes', 'Yes', 'Risk', 'Growth', 'Wealth Creation', '1-3 years', 'Weekly', '20%-30%', 'Equity', 'Health Care', 'Dividend', 'Fund Diversification', 'Assured Returns', 'Fixed Returns', 'Newspapers and Magazines'),
  ('Male', 29, 'Yes', 'Yes', 'Returns', 'Capital Appreciation', 'Wealth Creation', '3-5 years', 'Monthly', '20%-30%', 'Fixed Deposits', 'Retirement Plan', 'Dividend', 'Better Returns', 'Safe Investment', 'Fixed Returns', 'Financial Consultants');



-- PART 4: INSERT DATA - investment_ratings table
-- Must run AFTER investors data is inserted


INSERT INTO investment_ratings (
    investor_id, mutual_funds, equity_market,
    debentures, government_bonds, fixed_deposits, ppf, gold
)
VALUES
  (1, 1, 2, 5, 3, 7, 6, 4),
  (2, 4, 3, 2, 1, 5, 6, 7),
  (3, 3, 6, 4, 2, 5, 1, 7),
  (4, 2, 1, 3, 7, 6, 4, 5),
  (5, 2, 1, 3, 6, 4, 5, 7),
  (6, 7, 5, 4, 6, 3, 1, 2),
  (7, 3, 6, 4, 2, 5, 1, 7),
  (8, 2, 3, 7, 4, 6, 1, 5),
  (9, 2, 4, 7, 5, 3, 1, 6),
  (10, 1, 3, 7, 4, 5, 2, 6),
  (11, 2, 4, 7, 5, 3, 1, 6),
  (12, 2, 5, 7, 6, 3, 1, 4),
  (13, 1, 2, 3, 4, 5, 6, 7),
  (14, 2, 3, 7, 4, 5, 1, 6),
  (15, 2, 3, 7, 5, 4, 1, 6),
  (16, 2, 3, 7, 5, 4, 1, 6),
  (17, 3, 2, 7, 5, 4, 1, 6),
  (18, 3, 2, 7, 4, 5, 1, 6),
  (19, 3, 2, 7, 4, 5, 1, 6),
  (20, 3, 4, 6, 5, 1, 2, 7),
  (21, 2, 4, 7, 5, 3, 1, 6),
  (22, 2, 4, 5, 6, 3, 1, 7),
  (23, 3, 4, 6, 5, 2, 1, 7),
  (24, 2, 4, 6, 5, 3, 1, 7),
  (25, 2, 3, 7, 5, 4, 1, 6),
  (26, 3, 4, 7, 5, 1, 2, 6),
  (27, 3, 4, 6, 5, 1, 2, 7),
  (28, 2, 3, 7, 6, 4, 1, 5),
  (29, 2, 3, 6, 5, 1, 4, 7),
  (30, 5, 4, 3, 2, 7, 1, 6),
  (31, 4, 5, 1, 2, 7, 3, 6),
  (32, 2, 4, 7, 6, 3, 1, 5),
  (33, 2, 4, 7, 5, 1, 3, 6),
  (34, 2, 3, 6, 4, 1, 5, 7),
  (35, 2, 3, 6, 5, 4, 1, 7),
  (36, 1, 4, 6, 5, 3, 2, 7),
  (37, 2, 4, 7, 5, 1, 3, 6),
  (38, 5, 4, 7, 6, 1, 2, 3),
  (39, 2, 4, 7, 5, 3, 1, 6),
  (40, 4, 3, 5, 7, 2, 1, 6);


-- PART 5: VERIFY DATA LOADED CORRECTLY

SELECT COUNT(*) AS total_investors    FROM investors;
SELECT COUNT(*) AS total_rating_rows  FROM investment_ratings;

SELECT * FROM investors           LIMIT 5;
SELECT * FROM investment_ratings  LIMIT 5;



-- PART 6: BASIC ANALYSIS QUERIES


-- Gender distribution
SELECT
    gender,
    COUNT(*) AS total
FROM investors
GROUP BY gender
ORDER BY total DESC;

--  Age group distribution
SELECT
    age_group,
    COUNT(*) AS total,
    ROUND(AVG(age), 1) AS avg_age
FROM investors
GROUP BY age_group
ORDER BY age_group;

-- Preferred investment avenue
SELECT
    preferred_avenue,
    COUNT(*) AS total
FROM investors
GROUP BY preferred_avenue
ORDER BY total DESC;

-- Investment objective
SELECT
    objective,
    COUNT(*) AS total
FROM investors
GROUP BY objective
ORDER BY total DESC;

-- Investment duration
SELECT
    duration,
    COUNT(*) AS total
FROM investors
GROUP BY duration
ORDER BY total DESC;

-- Expected return range
SELECT
    expect,
    COUNT(*) AS total
FROM investors
GROUP BY expect
ORDER BY total DESC;

--  Average rating of all 7 investment types
SELECT
    ROUND(AVG(mutual_funds),     2) AS avg_mutual_funds,
    ROUND(AVG(equity_market),    2) AS avg_equity_market,
    ROUND(AVG(debentures),       2) AS avg_debentures,
    ROUND(AVG(government_bonds), 2) AS avg_govt_bonds,
    ROUND(AVG(fixed_deposits),   2) AS avg_fixed_deposits,
    ROUND(AVG(ppf),              2) AS avg_ppf,
    ROUND(AVG(gold),             2) AS avg_gold
FROM investment_ratings;

-- Which avenue is most preferred? (lower avg = more preferred)
SELECT avenue, avg_rating
FROM (
    VALUES
        ('Mutual Funds',     ROUND((SELECT AVG(mutual_funds)     FROM investment_ratings), 2)),
        ('Equity Market',    ROUND((SELECT AVG(equity_market)    FROM investment_ratings), 2)),
        ('Debentures',       ROUND((SELECT AVG(debentures)       FROM investment_ratings), 2)),
        ('Government Bonds', ROUND((SELECT AVG(government_bonds) FROM investment_ratings), 2)),
        ('Fixed Deposits',   ROUND((SELECT AVG(fixed_deposits)   FROM investment_ratings), 2)),
        ('PPF',              ROUND((SELECT AVG(ppf)              FROM investment_ratings), 2)),
        ('Gold',             ROUND((SELECT AVG(gold)             FROM investment_ratings), 2))
) AS x(avenue, avg_rating)
ORDER BY avg_rating;



-- PART 7: JOIN QUERIES


-- Investor details combined with their ratings
SELECT
    i.investor_id,
    i.gender,
    i.age,
    i.age_group,
    i.preferred_avenue,
    i.objective,
    i.expect,
    r.mutual_funds,
    r.equity_market,
    r.gold
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id
ORDER BY i.investor_id;

-- Average ratings by gender
SELECT
    i.gender,
    ROUND(AVG(r.mutual_funds),   2) AS avg_mutual_funds,
    ROUND(AVG(r.equity_market),  2) AS avg_equity,
    ROUND(AVG(r.gold),           2) AS avg_gold,
    ROUND(AVG(r.fixed_deposits), 2) AS avg_fd
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id
GROUP BY i.gender;

--  Avenue preference split by gender
SELECT
    preferred_avenue,
    COUNT(CASE WHEN gender = 'Male'   THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS female_count,
    COUNT(*) AS total
FROM investors
GROUP BY preferred_avenue
ORDER BY total DESC;

-- Objective vs duration
SELECT
    objective,
    duration,
    COUNT(*) AS total
FROM investors
GROUP BY objective, duration
ORDER BY objective, total DESC;

- Information source by gender
SELECT
    info_source,
    COUNT(CASE WHEN gender = 'Male'   THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS female_count,
    COUNT(*) AS total
FROM investors
GROUP BY info_source
ORDER BY total DESC;



-- PART 8: FILTER QUERIES


-- Investors expecting 30%-40% returns
SELECT investor_id, gender, age, preferred_avenue, objective
FROM investors
WHERE expect = '30%-40%'
ORDER BY age;

-- Young investors (age 21-25)
SELECT investor_id, age, gender, preferred_avenue, objective, duration
FROM investors
WHERE age_group = '21-25'
ORDER BY age;

--  Daily monitors who prefer Equity
SELECT investor_id, gender, age, preferred_avenue, invest_monitor, expect
FROM investors
WHERE invest_monitor = 'Daily'
  AND preferred_avenue = 'Equity';

-- Female investors with Capital Appreciation objective
SELECT investor_id, age, preferred_avenue, duration, expect
FROM investors
WHERE gender = 'Female'
  AND objective = 'Capital Appreciation'
ORDER BY age;

 Investors using Financial Consultants as info source
SELECT investor_id, gender, age, preferred_avenue, savings_objective
FROM investors
WHERE info_source = 'Financial Consultants'
ORDER BY preferred_avenue;


-- PART 9: VIEWS (saved queries you can reuse in Power BI)

-- View 1: Full investor profile with ratings
CREATE OR REPLACE VIEW investor_summary AS
SELECT
    i.investor_id,
    i.gender,
    i.age,
    i.age_group,
    i.preferred_avenue,
    i.objective,
    i.purpose,
    i.duration,
    i.expect,
    i.info_source,
    r.mutual_funds,
    r.equity_market,
    r.gold,
    r.fixed_deposits,
    r.ppf
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id;

SELECT * FROM investor_summary LIMIT 10;

-- View 2: Avenue preference by gender
CREATE OR REPLACE VIEW avenue_gender_summary AS
SELECT
    preferred_avenue,
    COUNT(CASE WHEN gender = 'Male'   THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS female_count,
    COUNT(*) AS total
FROM investors
GROUP BY preferred_avenue;

SELECT * FROM avenue_gender_summary ORDER BY total DESC;

-- View 3: Behaviour summary by age group
CREATE OR REPLACE VIEW agegroup_behavior AS
SELECT
    i.age_group,
    COUNT(*) AS total_investors,
    MODE() WITHIN GROUP (ORDER BY i.preferred_avenue) AS top_avenue,
    MODE() WITHIN GROUP (ORDER BY i.objective)        AS top_objective,
    MODE() WITHIN GROUP (ORDER BY i.expect)           AS top_expectation,
    ROUND(AVG(r.gold),         2) AS avg_gold_rating,
    ROUND(AVG(r.mutual_funds), 2) AS avg_mutual_rating
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id
GROUP BY i.age_group
ORDER BY i.age_group;

SELECT * FROM agegroup_behavior;



-- PART 10: WINDOW FUNCTIONS (advanced - for bonus marks)


-- Rank investors by age within each gender group
SELECT
    investor_id,
    gender,
    age,
    preferred_avenue,
    RANK() OVER (PARTITION BY gender ORDER BY age) AS age_rank
FROM investors;

-- How many investors chose each avenue (shown per row)
SELECT
    preferred_avenue,
    investor_id,
    gender,
    COUNT(*) OVER (PARTITION BY preferred_avenue) AS total_for_this_avenue
FROM investors
ORDER BY preferred_avenue, investor_id;

-- Each investor's gold rating vs overall average
SELECT
    i.investor_id,
    i.gender,
    r.gold                             AS my_gold_rating,
    ROUND(AVG(r.gold) OVER (), 2)      AS overall_avg_gold,
    r.gold - ROUND(AVG(r.gold) OVER(), 2) AS difference_from_avg
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id
ORDER BY difference_from_avg DESC;

--  Running total of investors by age
SELECT
    age,
    COUNT(*) AS investors_this_age,
    SUM(COUNT(*)) OVER (ORDER BY age) AS running_total
FROM investors
GROUP BY age
ORDER BY age;



-- PART 11: INDEXES (mkes queries faster)


CREATE INDEX IF NOT EXISTS idx_gender         ON investors(gender);
CREATE INDEX IF NOT EXISTS idx_age_group      ON investors(age_group);
CREATE INDEX IF NOT EXISTS idx_avenue         ON investors(preferred_avenue);
CREATE INDEX IF NOT EXISTS idx_objective      ON investors(objective);
CREATE INDEX IF NOT EXISTS idx_rating_inv_id  ON investment_ratings(investor_id);



-- PART 12: FINAL COMBINED QUERY FOR POWER BI
-- Connect Power BI to PostgreSQL and use this query


SELECT
    i.investor_id,
    i.gender,
    i.age,
    i.age_group,
    i.invests_in_avenues,
    i.factor,
    i.objective,
    i.purpose,
    i.duration,
    i.invest_monitor,
    i.expect,
    i.preferred_avenue,
    i.savings_objective,
    i.reason_equity,
    i.reason_mutual,
    i.reason_bonds,
    i.reason_fd,
    i.info_source,
    r.mutual_funds,
    r.equity_market,
    r.debentures,
    r.government_bonds,
    r.fixed_deposits,
    r.ppf,
    r.gold
FROM investors i
JOIN investment_ratings r ON i.investor_id = r.investor_id
ORDER BY i.investor_id;


