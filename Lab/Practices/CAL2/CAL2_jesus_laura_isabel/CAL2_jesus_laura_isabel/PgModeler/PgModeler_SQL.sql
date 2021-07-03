-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-alpha
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.supermarket | type: TABLE --
-- DROP TABLE IF EXISTS public.supermarket CASCADE;
CREATE TABLE public.supermarket(
	city char(40) NOT NULL,
	district char(40) NOT NULL,
	CONSTRAINT supermarket_pk PRIMARY KEY (city,district)

);
-- ddl-end --
COMMENT ON TABLE public.supermarket IS 'Table where we will insert information about the supermarket. ';
-- ddl-end --
COMMENT ON COLUMN public.supermarket.city IS 'Name of the city.';
-- ddl-end --
COMMENT ON COLUMN public.supermarket.district IS 'Name of the district where the supermarket is.';
-- ddl-end --
ALTER TABLE public.supermarket OWNER TO postgres;
-- ddl-end --

-- object: public.worker | type: TABLE --
-- DROP TABLE IF EXISTS public.worker CASCADE;
CREATE TABLE public.worker(
	"ID" char(9) NOT NULL,
	name char(40) NOT NULL,
	phone integer NOT NULL,
	"timeTable" char(1) NOT NULL,
	city_supermarket char(40),
	district_supermarket char(40),
	type char(40) NOT NULL,
	CONSTRAINT worker_pk PRIMARY KEY ("ID")

);
-- ddl-end --
COMMENT ON TABLE public.worker IS 'Super entity.
Table where we will write the information about worker.';
-- ddl-end --
COMMENT ON COLUMN public.worker."ID" IS 'ID has 8 numbers and 1 letter.';
-- ddl-end --
COMMENT ON COLUMN public.worker.name IS 'The worker''s name.';
-- ddl-end --
COMMENT ON COLUMN public.worker.phone IS 'The worker''s phone.';
-- ddl-end --
COMMENT ON COLUMN public.worker."timeTable" IS 'Morning / Afternoon';
-- ddl-end --
COMMENT ON COLUMN public.worker.type IS 'Defines the type of worker. It can be Cashier or Repletener. ';
-- ddl-end --
ALTER TABLE public.worker OWNER TO postgres;
-- ddl-end --

-- object: public.cashier | type: TABLE --
-- DROP TABLE IF EXISTS public.cashier CASCADE;
CREATE TABLE public.cashier(
	"ID" char(9) NOT NULL,

-- 	name char(40) NOT NULL,
-- 	phone integer NOT NULL,
-- 	"timeTable" char(1) NOT NULL,
-- 	type char(40) NOT NULL,
-- 	city_supermarket char(40),
-- 	district_supermarket char(40),
	CONSTRAINT cashier_pk PRIMARY KEY ("ID")

) INHERITS(public.worker)
;
-- ddl-end --
COMMENT ON TABLE public.cashier IS 'Sub entity.
Casier is a tipe of worker.
Table where we will write information about cashier.';
-- ddl-end --
COMMENT ON COLUMN public.cashier."ID" IS 'ID has 8 numbers and 1 letter';
-- ddl-end --
ALTER TABLE public.cashier OWNER TO postgres;
-- ddl-end --

-- object: public.repletener | type: TABLE --
-- DROP TABLE IF EXISTS public.repletener CASCADE;
CREATE TABLE public.repletener(
	"ID" char(9) NOT NULL,
	"numberHours" integer NOT NULL DEFAULT 1,

-- 	name char(40) NOT NULL,
-- 	phone integer NOT NULL,
-- 	"timeTable" char(1) NOT NULL,
-- 	type char(40) NOT NULL,
-- 	city_supermarket char(40),
-- 	district_supermarket char(40),
	CONSTRAINT repletener_pk PRIMARY KEY ("ID")

) INHERITS(public.worker)
;
-- ddl-end --
COMMENT ON TABLE public.repletener IS 'Sub entity.
It is a tipe of worker.
Table where we will write information about repletener.';
-- ddl-end --
COMMENT ON COLUMN public.repletener."ID" IS '8 numbers and 1 letter';
-- ddl-end --
COMMENT ON COLUMN public.repletener."numberHours" IS 'It must be less than 24 hours and more than 0.';
-- ddl-end --
ALTER TABLE public.repletener OWNER TO postgres;
-- ddl-end --

-- object: public.member | type: TABLE --
-- DROP TABLE IF EXISTS public.member CASCADE;
CREATE TABLE public.member(
	"membershipCode" integer NOT NULL,
	name char(40) NOT NULL,
	email char(40) NOT NULL,
	address char(40) NOT NULL,
	"telephoneNumer" integer,
	"pointsAccumulated" integer NOT NULL DEFAULT 0,
	CONSTRAINT member_pk PRIMARY KEY ("membershipCode")

);
-- ddl-end --
COMMENT ON TABLE public.member IS 'Table where we will write information about member.';
-- ddl-end --
COMMENT ON COLUMN public.member."membershipCode" IS 'The identification of the member.';
-- ddl-end --
COMMENT ON COLUMN public.member.name IS 'The member''s name.';
-- ddl-end --
COMMENT ON COLUMN public.member.email IS 'The member''s email.';
-- ddl-end --
COMMENT ON COLUMN public.member.address IS 'The member''s address.';
-- ddl-end --
COMMENT ON COLUMN public.member."telephoneNumer" IS 'It is multivalued and optional.
The member''s telephone number.';
-- ddl-end --
COMMENT ON COLUMN public.member."pointsAccumulated" IS 'The member''s accumulated points.';
-- ddl-end --
ALTER TABLE public.member OWNER TO postgres;
-- ddl-end --

-- object: public."telephoneNumber" | type: TABLE --
-- DROP TABLE IF EXISTS public."telephoneNumber" CASCADE;
CREATE TABLE public."telephoneNumber"(
	"telephoneNumer" integer,
	"membershipCode_member" integer NOT NULL,
	CONSTRAINT "telephoneNumber_pk" PRIMARY KEY ("membershipCode_member")

);
-- ddl-end --
COMMENT ON TABLE public."telephoneNumber" IS 'Table of the maltivalued attribute of member''s telephoneNumber.';
-- ddl-end --
COMMENT ON COLUMN public."telephoneNumber"."telephoneNumer" IS 'The member''s telephone member.';
-- ddl-end --
ALTER TABLE public."telephoneNumber" OWNER TO postgres;
-- ddl-end --

-- object: public.coupon | type: TABLE --
-- DROP TABLE IF EXISTS public.coupon CASCADE;
CREATE TABLE public.coupon(
	"ID" integer NOT NULL,
	percentage integer NOT NULL,
	CONSTRAINT coupon_pk PRIMARY KEY ("ID")

);
-- ddl-end --
COMMENT ON TABLE public.coupon IS 'Table where we will write information about coupon.';
-- ddl-end --
COMMENT ON COLUMN public.coupon."ID" IS 'The ID of each coupon.';
-- ddl-end --
COMMENT ON COLUMN public.coupon.percentage IS 'Percentage applied in the coupon';
-- ddl-end --
ALTER TABLE public.coupon OWNER TO postgres;
-- ddl-end --

-- object: public.opinion | type: TABLE --
-- DROP TABLE IF EXISTS public.opinion CASCADE;
CREATE TABLE public.opinion(
	date date NOT NULL,
	"time" time NOT NULL,
	score integer NOT NULL DEFAULT 0,
	"membershipCode_member" integer,
	CONSTRAINT opinion_pk PRIMARY KEY (date,"time")

);
-- ddl-end --
COMMENT ON TABLE public.opinion IS 'Table wher we will write information about opinion.';
-- ddl-end --
COMMENT ON COLUMN public.opinion.date IS 'DD/MM/YYYY
It is the date when the opinion is written.';
-- ddl-end --
COMMENT ON COLUMN public.opinion."time" IS 'HH:MM:SS';
-- ddl-end --
COMMENT ON COLUMN public.opinion.score IS 'It must be 0 <= x <= 10';
-- ddl-end --
ALTER TABLE public.opinion OWNER TO postgres;
-- ddl-end --

-- object: public.discount | type: TABLE --
-- DROP TABLE IF EXISTS public.discount CASCADE;
CREATE TABLE public.discount(
	week integer NOT NULL,
	percentage integer NOT NULL DEFAULT 0,
	CONSTRAINT discount_pk PRIMARY KEY (week)

);
-- ddl-end --
COMMENT ON TABLE public.discount IS 'Table where we will write information about discount.';
-- ddl-end --
COMMENT ON COLUMN public.discount.week IS 'The number of the week of the year.';
-- ddl-end --
COMMENT ON COLUMN public.discount.percentage IS '0 <= x < 100';
-- ddl-end --
ALTER TABLE public.discount OWNER TO postgres;
-- ddl-end --

-- object: public.ticket | type: TABLE --
-- DROP TABLE IF EXISTS public.ticket CASCADE;
CREATE TABLE public.ticket(
	"ID" char(40) NOT NULL,
	date date NOT NULL,
	"timeIssuance" time NOT NULL,
	coupon_used boolean NOT NULL,
	"totalPrice" float NOT NULL,
	"ID_cashier" char(9),
	"membershipCode_member" integer,
	"usesAccumulatedNumber" boolean NOT NULL,
	"quantityUsed" float,
	CONSTRAINT ticket_pk PRIMARY KEY ("ID")

);
-- ddl-end --
COMMENT ON TABLE public.ticket IS 'Table where we will write information about ticket.';
-- ddl-end --
COMMENT ON COLUMN public.ticket."ID" IS 'The ticket identifier code';
-- ddl-end --
COMMENT ON COLUMN public.ticket.date IS 'DD/MM/YYYY';
-- ddl-end --
COMMENT ON COLUMN public.ticket."timeIssuance" IS 'HH:MM:SS';
-- ddl-end --
COMMENT ON COLUMN public.ticket."totalPrice" IS 'Total billed from the ticket';
-- ddl-end --
COMMENT ON COLUMN public.ticket."usesAccumulatedNumber" IS 'If the money accumulated is used (true/false)';
-- ddl-end --
COMMENT ON COLUMN public.ticket."quantityUsed" IS 'Quantity used';
-- ddl-end --
ALTER TABLE public.ticket OWNER TO postgres;
-- ddl-end --

-- object: public.product | type: TABLE --
-- DROP TABLE IF EXISTS public.product CASCADE;
CREATE TABLE public.product(
	"barCode" integer NOT NULL,
	name_product char(40) NOT NULL,
	"priceVAT" real NOT NULL DEFAULT 0,
	"priceNotVAT" real NOT NULL DEFAULT 0,
	week_discount integer,
	"startDate" date,
	"endDate" date,
	CONSTRAINT product_pk PRIMARY KEY ("barCode")

);
-- ddl-end --
COMMENT ON TABLE public.product IS 'Table where we will write information about product.';
-- ddl-end --
COMMENT ON COLUMN public.product."barCode" IS 'The bar code of the product.';
-- ddl-end --
COMMENT ON COLUMN public.product.name_product IS 'Name of the product purchased';
-- ddl-end --
COMMENT ON COLUMN public.product."priceVAT" IS 'The price Vat of the product.';
-- ddl-end --
COMMENT ON COLUMN public.product."priceNotVAT" IS 'The price not VAT of the product.';
-- ddl-end --
COMMENT ON COLUMN public.product."startDate" IS 'Date of starting';
-- ddl-end --
COMMENT ON COLUMN public.product."endDate" IS 'Date of death  of the coupon';
-- ddl-end --
ALTER TABLE public.product OWNER TO postgres;
-- ddl-end --

-- object: public.phone | type: TABLE --
-- DROP TABLE IF EXISTS public.phone CASCADE;
CREATE TABLE public.phone(
	phone integer,
	"ID_worker" char(9) NOT NULL,
	CONSTRAINT phone_pk PRIMARY KEY ("ID_worker")

);
-- ddl-end --
COMMENT ON TABLE public.phone IS 'Multivalued attribute of worker.';
-- ddl-end --
COMMENT ON COLUMN public.phone.phone IS 'The worker''s phone.';
-- ddl-end --
ALTER TABLE public.phone OWNER TO postgres;
-- ddl-end --

-- object: worker_fk | type: CONSTRAINT --
-- ALTER TABLE public.phone DROP CONSTRAINT IF EXISTS worker_fk CASCADE;
ALTER TABLE public.phone ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker")
REFERENCES public.worker ("ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: member_fk | type: CONSTRAINT --
-- ALTER TABLE public."telephoneNumber" DROP CONSTRAINT IF EXISTS member_fk CASCADE;
ALTER TABLE public."telephoneNumber" ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member")
REFERENCES public.member ("membershipCode") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.muchos_member_tiene_muchos_coupon | type: TABLE --
-- DROP TABLE IF EXISTS public.muchos_member_tiene_muchos_coupon CASCADE;
CREATE TABLE public.muchos_member_tiene_muchos_coupon(
	"membershipCode_member" integer NOT NULL,
	"ID_coupon" integer NOT NULL,
	CONSTRAINT muchos_member_tiene_muchos_coupon_pk PRIMARY KEY ("membershipCode_member","ID_coupon")

);
-- ddl-end --

-- object: member_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT IF EXISTS member_fk CASCADE;
ALTER TABLE public.muchos_member_tiene_muchos_coupon ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member")
REFERENCES public.member ("membershipCode") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: coupon_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT IF EXISTS coupon_fk CASCADE;
ALTER TABLE public.muchos_member_tiene_muchos_coupon ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon")
REFERENCES public.coupon ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: cashier_fk | type: CONSTRAINT --
-- ALTER TABLE public.ticket DROP CONSTRAINT IF EXISTS cashier_fk CASCADE;
ALTER TABLE public.ticket ADD CONSTRAINT cashier_fk FOREIGN KEY ("ID_cashier")
REFERENCES public.cashier ("ID") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: member_fk | type: CONSTRAINT --
-- ALTER TABLE public.opinion DROP CONSTRAINT IF EXISTS member_fk CASCADE;
ALTER TABLE public.opinion ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member")
REFERENCES public.member ("membershipCode") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: discount_fk | type: CONSTRAINT --
-- ALTER TABLE public.product DROP CONSTRAINT IF EXISTS discount_fk CASCADE;
ALTER TABLE public.product ADD CONSTRAINT discount_fk FOREIGN KEY (week_discount)
REFERENCES public.discount (week) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: supermarket_fk | type: CONSTRAINT --
-- ALTER TABLE public.worker DROP CONSTRAINT IF EXISTS supermarket_fk CASCADE;
ALTER TABLE public.worker ADD CONSTRAINT supermarket_fk FOREIGN KEY (city_supermarket,district_supermarket)
REFERENCES public.supermarket (city,district) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: member_fk | type: CONSTRAINT --
-- ALTER TABLE public.ticket DROP CONSTRAINT IF EXISTS member_fk CASCADE;
ALTER TABLE public.ticket ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member")
REFERENCES public.member ("membershipCode") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.muchos_ticket_tiene_muchos_product | type: TABLE --
-- DROP TABLE IF EXISTS public.muchos_ticket_tiene_muchos_product CASCADE;
CREATE TABLE public.muchos_ticket_tiene_muchos_product(
	"ID_ticket" char(40) NOT NULL,
	"barCode_product" integer NOT NULL,
	amount integer NOT NULL,
	CONSTRAINT muchos_ticket_tiene_muchos_product_pk PRIMARY KEY ("ID_ticket","barCode_product")

);
-- ddl-end --
COMMENT ON COLUMN public.muchos_ticket_tiene_muchos_product.amount IS 'Quantity of the product in the ticket';
-- ddl-end --

-- object: ticket_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT IF EXISTS ticket_fk CASCADE;
ALTER TABLE public.muchos_ticket_tiene_muchos_product ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket")
REFERENCES public.ticket ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.muchos_ticket_tiene_muchos_product ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product")
REFERENCES public.product ("barCode") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.returned | type: TABLE --
-- DROP TABLE IF EXISTS public.returned CASCADE;
CREATE TABLE public.returned(
	"barCode_product" integer NOT NULL,
	"ID_ticket" char(40) NOT NULL,
	amount integer NOT NULL,
	CONSTRAINT returned_pk PRIMARY KEY ("barCode_product","ID_ticket")

);
-- ddl-end --
COMMENT ON COLUMN public.returned.amount IS 'Amount of the product returned';
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.returned DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.returned ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product")
REFERENCES public.product ("barCode") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: ticket_fk | type: CONSTRAINT --
-- ALTER TABLE public.returned DROP CONSTRAINT IF EXISTS ticket_fk CASCADE;
ALTER TABLE public.returned ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket")
REFERENCES public.ticket ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.muchos_coupon_tiene_muchos_product | type: TABLE --
-- DROP TABLE IF EXISTS public.muchos_coupon_tiene_muchos_product CASCADE;
CREATE TABLE public.muchos_coupon_tiene_muchos_product(
	"ID_coupon" integer NOT NULL,
	"barCode_product" integer NOT NULL,
	CONSTRAINT muchos_coupon_tiene_muchos_product_pk PRIMARY KEY ("ID_coupon","barCode_product")

);
-- ddl-end --

-- object: coupon_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT IF EXISTS coupon_fk CASCADE;
ALTER TABLE public.muchos_coupon_tiene_muchos_product ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon")
REFERENCES public.coupon ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.muchos_coupon_tiene_muchos_product ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product")
REFERENCES public.product ("barCode") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.muchos_worker_tiene_muchos_worker | type: TABLE --
-- DROP TABLE IF EXISTS public.muchos_worker_tiene_muchos_worker CASCADE;
CREATE TABLE public.muchos_worker_tiene_muchos_worker(
	"ID_worker" char(9) NOT NULL,
	"ID_worker1" char(9) NOT NULL,
	grade float NOT NULL,
	CONSTRAINT muchos_worker_tiene_muchos_worker_pk PRIMARY KEY ("ID_worker","ID_worker1")

);
-- ddl-end --
COMMENT ON COLUMN public.muchos_worker_tiene_muchos_worker.grade IS 'Each worker is assigned an average grade as a result of an evaluation carried out on him by the rest of his colleagues.';
-- ddl-end --

-- object: worker_fk | type: CONSTRAINT --
-- ALTER TABLE public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT IF EXISTS worker_fk CASCADE;
ALTER TABLE public.muchos_worker_tiene_muchos_worker ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker")
REFERENCES public.worker ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: worker_fk1 | type: CONSTRAINT --
-- ALTER TABLE public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT IF EXISTS worker_fk1 CASCADE;
ALTER TABLE public.muchos_worker_tiene_muchos_worker ADD CONSTRAINT worker_fk1 FOREIGN KEY ("ID_worker1")
REFERENCES public.worker ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


