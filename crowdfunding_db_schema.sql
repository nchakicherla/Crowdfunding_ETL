DROP TABLE IF EXISTS contacts CASCADE;
CREATE TABLE "contacts" (
  "contact_id" int NOT NULL,
  "first_name" varchar(32) NOT NULL,
  "last_name" varchar(32) NOT NULL,
  "email" varchar(64) NOT NULL,
  CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_id")
);

DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE "category" (
  "category_id" varchar(16) NOT NULL,
  "category" varchar(32) NOT NULL,
  CONSTRAINT "pk_category" PRIMARY KEY ("category_id")
);

DROP TABLE IF EXISTS subcategory CASCADE;
CREATE TABLE "subcategory" (
  "subcategory_id" varchar(16) NOT NULL,
  "subcategory" varchar(32) NOT NULL,
  CONSTRAINT "pk_subcategory" PRIMARY KEY ("subcategory_id")
);

DROP TABLE IF EXISTS campaign CASCADE;
CREATE TABLE "campaign" (
  "cf_id" int NOT NULL,
  "contact_id" int NOT NULL,
  "company_name" varchar(64) NOT NULL,
  "description" varchar(128) NOT NULL,
  "goal" float NOT NULL,
  "pledged" float NOT NULL,
  "outcome" varchar(32) NOT NULL,
  "backers_count" int NOT NULL,
  "country" varchar(2) NOT NULL,
  "currency" varchar(3) NOT NULL,
  "launch_date" date NOT NULL,
  "end_date" date NOT NULL,
  "category_id" varchar(16) NOT NULL,
  "subcategory_id" varchar(16) NOT NULL,
  CONSTRAINT "pk_campaign" PRIMARY KEY ("cf_id")
);

ALTER TABLE
  "campaign"
ADD
  CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id") REFERENCES "contacts" ("contact_id");
ALTER TABLE
  "campaign"
ADD
  CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id") REFERENCES "category" ("category_id");
ALTER TABLE
  "campaign"
ADD
  CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id") REFERENCES "subcategory" ("subcategory_id");

/*
COPY contacts (contact_id, first_name, last_name, email)
FROM '/tmp/contacts.csv'
DELIMITER ','
CSV HEADER;

COPY category (category_id, category)
FROM '/tmp/category.csv'
DELIMITER ','
CSV HEADER;

COPY subcategory (subcategory_id, subcategory)
FROM '/tmp/subcategory.csv'
DELIMITER ','
CSV HEADER;

COPY campaign (cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launch_date, end_date, category_id, subcategory_id)
FROM '/tmp/campaign.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM campaign
*/