PGDMP         7                 x            CAL3    12.0    12.0 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17793    CAL3    DATABASE     d   CREATE DATABASE "CAL3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "CAL3";
                postgres    false            ?            1255    25787    avg_grade()    FUNCTION     L  CREATE FUNCTION public.avg_grade() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
	DECLARE
  BEGIN    
UPDATE worker SET "averageGrade" = 
	(SELECT AVG(grade) FROM muchos_worker_tiene_muchos_worker	INNER JOIN worker ON "ID"="ID_worker1" WHERE ("ID" = new."ID_worker1"))
	WHERE "ID" = new."ID_worker1";

   RETURN NULL;
  END;
$$;
 "   DROP FUNCTION public.avg_grade();
       public          postgres    false            ?            1255    25795    insert_product()    FUNCTION     ?   CREATE FUNCTION public.insert_product() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update product
set stock = 10;
return new;
end
$$;
 '   DROP FUNCTION public.insert_product();
       public          postgres    false            ?            1255    25789    vat_price()    FUNCTION     ?   CREATE FUNCTION public.vat_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update product
set "priceVAT" = "priceNotVAT" + "priceNotVAT" * 0.21;
return new;
end
$$;
 "   DROP FUNCTION public.vat_price();
       public          postgres    false            ?            1259    17804    cashier    TABLE     g   CREATE TABLE public.cashier (
    "ID" character(9) NOT NULL,
    "ID_worker" character(9) NOT NULL
);
    DROP TABLE public.cashier;
       public         heap    postgres    false            ?           0    0    TABLE cashier    COMMENT     ?   COMMENT ON TABLE public.cashier IS 'Sub entity.
Casier is a tipe of worker.
Table where we will write information about cashier.';
          public          postgres    false    204            ?           0    0    COLUMN cashier."ID"    COMMENT     J   COMMENT ON COLUMN public.cashier."ID" IS 'ID has 8 numbers and 1 letter';
          public          postgres    false    204            ?           0    0    TABLE cashier    ACL     ?   GRANT ALL ON TABLE public.cashier TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cashier TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cashier TO "HHRR_Manager";
          public          postgres    false    204            ?            1259    17826    coupon    TABLE     [   CREATE TABLE public.coupon (
    "ID" integer NOT NULL,
    percentage integer NOT NULL
);
    DROP TABLE public.coupon;
       public         heap    postgres    false            ?           0    0    TABLE coupon    COMMENT     Y   COMMENT ON TABLE public.coupon IS 'Table where we will write information about coupon.';
          public          postgres    false    208            ?           0    0    COLUMN coupon."ID"    COMMENT     B   COMMENT ON COLUMN public.coupon."ID" IS 'The ID of each coupon.';
          public          postgres    false    208            ?           0    0    COLUMN coupon.percentage    COMMENT     R   COMMENT ON COLUMN public.coupon.percentage IS 'Percentage applied in the coupon';
          public          postgres    false    208            ?           0    0    TABLE coupon    ACL     ?   GRANT ALL ON TABLE public.coupon TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.coupon TO "Manager";
GRANT SELECT ON TABLE public.coupon TO "Cashier";
          public          postgres    false    208            ?            1259    17837    discount    TABLE     g   CREATE TABLE public.discount (
    week integer NOT NULL,
    percentage integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.discount;
       public         heap    postgres    false            ?           0    0    TABLE discount    COMMENT     ]   COMMENT ON TABLE public.discount IS 'Table where we will write information about discount.';
          public          postgres    false    210            ?           0    0    COLUMN discount.week    COMMENT     Q   COMMENT ON COLUMN public.discount.week IS 'The number of the week of the year.';
          public          postgres    false    210            ?           0    0    COLUMN discount.percentage    COMMENT     @   COMMENT ON COLUMN public.discount.percentage IS '0 <= x < 100';
          public          postgres    false    210            ?           0    0    TABLE discount    ACL     ?   GRANT ALL ON TABLE public.discount TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.discount TO "Manager";
GRANT SELECT ON TABLE public.discount TO "Cashier";
          public          postgres    false    210            ?            1259    17815    member    TABLE     ?   CREATE TABLE public.member (
    "membershipCode" integer NOT NULL,
    name character(40) NOT NULL,
    email character(40) NOT NULL,
    address character(40) NOT NULL,
    "telephoneNumer" integer,
    "pointsAccumulated" integer DEFAULT 0
);
    DROP TABLE public.member;
       public         heap    postgres    false            ?           0    0    TABLE member    COMMENT     Y   COMMENT ON TABLE public.member IS 'Table where we will write information about member.';
          public          postgres    false    206            ?           0    0    COLUMN member."membershipCode"    COMMENT     Y   COMMENT ON COLUMN public.member."membershipCode" IS 'The identification of the member.';
          public          postgres    false    206            ?           0    0    COLUMN member.name    COMMENT     ?   COMMENT ON COLUMN public.member.name IS 'The member''s name.';
          public          postgres    false    206            ?           0    0    COLUMN member.email    COMMENT     A   COMMENT ON COLUMN public.member.email IS 'The member''s email.';
          public          postgres    false    206            ?           0    0    COLUMN member.address    COMMENT     E   COMMENT ON COLUMN public.member.address IS 'The member''s address.';
          public          postgres    false    206            ?           0    0    COLUMN member."telephoneNumer"    COMMENT     w   COMMENT ON COLUMN public.member."telephoneNumer" IS 'It is multivalued and optional.
The member''s telephone number.';
          public          postgres    false    206            ?           0    0 !   COLUMN member."pointsAccumulated"    COMMENT     \   COMMENT ON COLUMN public.member."pointsAccumulated" IS 'The member''s accumulated points.';
          public          postgres    false    206            ?           0    0    TABLE member    ACL     |   GRANT ALL ON TABLE public.member TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.member TO "Manager";
          public          postgres    false    206            ?            1259    17940 "   muchos_coupon_tiene_muchos_product    TABLE     ?   CREATE TABLE public.muchos_coupon_tiene_muchos_product (
    "ID_coupon" integer NOT NULL,
    "barCode_product" integer NOT NULL
);
 6   DROP TABLE public.muchos_coupon_tiene_muchos_product;
       public         heap    postgres    false            ?           0    0 (   TABLE muchos_coupon_tiene_muchos_product    ACL       GRANT ALL ON TABLE public.muchos_coupon_tiene_muchos_product TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_coupon_tiene_muchos_product TO "Manager";
GRANT SELECT ON TABLE public.muchos_coupon_tiene_muchos_product TO "Cashier";
          public          postgres    false    217            ?            1259    17870 !   muchos_member_tiene_muchos_coupon    TABLE     ?   CREATE TABLE public.muchos_member_tiene_muchos_coupon (
    "membershipCode_member" integer NOT NULL,
    "ID_coupon" integer NOT NULL
);
 5   DROP TABLE public.muchos_member_tiene_muchos_coupon;
       public         heap    postgres    false            ?           0    0 '   TABLE muchos_member_tiene_muchos_coupon    ACL     ?   GRANT ALL ON TABLE public.muchos_member_tiene_muchos_coupon TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_member_tiene_muchos_coupon TO "Manager";
GRANT SELECT ON TABLE public.muchos_member_tiene_muchos_coupon TO "Cashier";
          public          postgres    false    214            ?            1259    17910 "   muchos_ticket_tiene_muchos_product    TABLE     ?   CREATE TABLE public.muchos_ticket_tiene_muchos_product (
    "ID_ticket" character(40) NOT NULL,
    "barCode_product" integer NOT NULL,
    amount integer NOT NULL
);
 6   DROP TABLE public.muchos_ticket_tiene_muchos_product;
       public         heap    postgres    false            ?           0    0 0   COLUMN muchos_ticket_tiene_muchos_product.amount    COMMENT     o   COMMENT ON COLUMN public.muchos_ticket_tiene_muchos_product.amount IS 'Quantity of the product in the ticket';
          public          postgres    false    215            ?           0    0 (   TABLE muchos_ticket_tiene_muchos_product    ACL       GRANT ALL ON TABLE public.muchos_ticket_tiene_muchos_product TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_ticket_tiene_muchos_product TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_ticket_tiene_muchos_product TO "Cashier";
          public          postgres    false    215            ?            1259    17955 !   muchos_worker_tiene_muchos_worker    TABLE     ?   CREATE TABLE public.muchos_worker_tiene_muchos_worker (
    "ID_worker" character(9) NOT NULL,
    "ID_worker1" character(9) NOT NULL,
    grade double precision NOT NULL
);
 5   DROP TABLE public.muchos_worker_tiene_muchos_worker;
       public         heap    postgres    false            ?           0    0 .   COLUMN muchos_worker_tiene_muchos_worker.grade    COMMENT     ?   COMMENT ON COLUMN public.muchos_worker_tiene_muchos_worker.grade IS 'Each worker is assigned an average grade as a result of an evaluation carried out on him by the rest of his colleagues.';
          public          postgres    false    218            ?           0    0 '   TABLE muchos_worker_tiene_muchos_worker    ACL       GRANT ALL ON TABLE public.muchos_worker_tiene_muchos_worker TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_worker_tiene_muchos_worker TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.muchos_worker_tiene_muchos_worker TO "HHRR_Manager";
          public          postgres    false    218            ?            1259    17831    opinion    TABLE     ?   CREATE TABLE public.opinion (
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    "membershipCode_member" integer
);
    DROP TABLE public.opinion;
       public         heap    postgres    false            ?           0    0    TABLE opinion    COMMENT     Z   COMMENT ON TABLE public.opinion IS 'Table wher we will write information about opinion.';
          public          postgres    false    209            ?           0    0    COLUMN opinion.date    COMMENT     c   COMMENT ON COLUMN public.opinion.date IS 'DD/MM/YYYY
It is the date when the opinion is written.';
          public          postgres    false    209            ?           0    0    COLUMN opinion."time"    COMMENT     7   COMMENT ON COLUMN public.opinion."time" IS 'HH:MM:SS';
          public          postgres    false    209            ?           0    0    COLUMN opinion.score    COMMENT     E   COMMENT ON COLUMN public.opinion.score IS 'It must be 0 <= x <= 10';
          public          postgres    false    209            ?           0    0    TABLE opinion    ACL     ~   GRANT ALL ON TABLE public.opinion TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.opinion TO "Manager";
          public          postgres    false    209            ?            1259    17855    phone    TABLE     X   CREATE TABLE public.phone (
    phone integer,
    "ID_worker" character(9) NOT NULL
);
    DROP TABLE public.phone;
       public         heap    postgres    false            ?           0    0    TABLE phone    COMMENT     E   COMMENT ON TABLE public.phone IS 'Multivalued attribute of worker.';
          public          postgres    false    213            ?           0    0    COLUMN phone.phone    COMMENT     @   COMMENT ON COLUMN public.phone.phone IS 'The worker''s phone.';
          public          postgres    false    213            ?           0    0    TABLE phone    ACL     z   GRANT ALL ON TABLE public.phone TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.phone TO "Manager";
          public          postgres    false    213            ?            1259    17848    product    TABLE       CREATE TABLE public.product (
    "barCode" integer NOT NULL,
    name_product character(40) NOT NULL,
    "priceNotVAT" real DEFAULT 0 NOT NULL,
    "priceVAT" real DEFAULT 0,
    stock integer,
    week_discount integer,
    "startDate" date,
    "endDate" date
);
    DROP TABLE public.product;
       public         heap    postgres    false            ?           0    0    TABLE product    COMMENT     [   COMMENT ON TABLE public.product IS 'Table where we will write information about product.';
          public          postgres    false    212            ?           0    0    COLUMN product."barCode"    COMMENT     N   COMMENT ON COLUMN public.product."barCode" IS 'The bar code of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product.name_product    COMMENT     R   COMMENT ON COLUMN public.product.name_product IS 'Name of the product purchased';
          public          postgres    false    212            ?           0    0    COLUMN product."priceNotVAT"    COMMENT     W   COMMENT ON COLUMN public.product."priceNotVAT" IS 'The price not VAT of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product."priceVAT"    COMMENT     P   COMMENT ON COLUMN public.product."priceVAT" IS 'The price Vat of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product.stock    COMMENT     :   COMMENT ON COLUMN public.product.stock IS 'Calculated()';
          public          postgres    false    212            ?           0    0    COLUMN product."startDate"    COMMENT     D   COMMENT ON COLUMN public.product."startDate" IS 'Date of starting';
          public          postgres    false    212            ?           0    0    COLUMN product."endDate"    COMMENT     N   COMMENT ON COLUMN public.product."endDate" IS 'Date of death  of the coupon';
          public          postgres    false    212            ?           0    0    TABLE product    ACL     ?   GRANT ALL ON TABLE public.product TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.product TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.product TO "Cashier";
          public          postgres    false    212            ?            1259    17809 
   repletener    TABLE     ?   CREATE TABLE public.repletener (
    "ID" character(9) NOT NULL,
    "numberHours" integer DEFAULT 1 NOT NULL,
    "ID_worker" character(9) NOT NULL
);
    DROP TABLE public.repletener;
       public         heap    postgres    false            ?           0    0    TABLE repletener    COMMENT     ?   COMMENT ON TABLE public.repletener IS 'Sub entity.
It is a tipe of worker.
Table where we will write information about repletener.';
          public          postgres    false    205            ?           0    0    COLUMN repletener."ID"    COMMENT     F   COMMENT ON COLUMN public.repletener."ID" IS '8 numbers and 1 letter';
          public          postgres    false    205                        0    0    COLUMN repletener."numberHours"    COMMENT     g   COMMENT ON COLUMN public.repletener."numberHours" IS 'It must be less than 24 hours and more than 0.';
          public          postgres    false    205                       0    0    TABLE repletener    ACL     ?   GRANT ALL ON TABLE public.repletener TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.repletener TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.repletener TO "HHRR_Manager";
          public          postgres    false    205            ?            1259    17925    returned    TABLE     ?   CREATE TABLE public.returned (
    "barCode_product" integer NOT NULL,
    "ID_ticket" character(40) NOT NULL,
    amount integer NOT NULL
);
    DROP TABLE public.returned;
       public         heap    postgres    false                       0    0    COLUMN returned.amount    COMMENT     N   COMMENT ON COLUMN public.returned.amount IS 'Amount of the product returned';
          public          postgres    false    216                       0    0    TABLE returned    ACL     ?   GRANT ALL ON TABLE public.returned TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.returned TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.returned TO "Cashier";
          public          postgres    false    216            ?            1259    17794    supermarket    TABLE     j   CREATE TABLE public.supermarket (
    city character(40) NOT NULL,
    district character(40) NOT NULL
);
    DROP TABLE public.supermarket;
       public         heap    postgres    false                       0    0    TABLE supermarket    COMMENT     i   COMMENT ON TABLE public.supermarket IS 'Table where we will insert information about the supermarket. ';
          public          postgres    false    202                       0    0    COLUMN supermarket.city    COMMENT     B   COMMENT ON COLUMN public.supermarket.city IS 'Name of the city.';
          public          postgres    false    202                       0    0    COLUMN supermarket.district    COMMENT     c   COMMENT ON COLUMN public.supermarket.district IS 'Name of the district where the supermarket is.';
          public          postgres    false    202                       0    0    TABLE supermarket    ACL     ?   GRANT ALL ON TABLE public.supermarket TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.supermarket TO "Manager";
          public          postgres    false    202            ?            1259    17821    telephoneNumber    TABLE     v   CREATE TABLE public."telephoneNumber" (
    "telephoneNumer" integer,
    "membershipCode_member" integer NOT NULL
);
 %   DROP TABLE public."telephoneNumber";
       public         heap    postgres    false                       0    0    TABLE "telephoneNumber"    COMMENT     q   COMMENT ON TABLE public."telephoneNumber" IS 'Table of the maltivalued attribute of member''s telephoneNumber.';
          public          postgres    false    207            	           0    0 )   COLUMN "telephoneNumber"."telephoneNumer"    COMMENT     b   COMMENT ON COLUMN public."telephoneNumber"."telephoneNumer" IS 'The member''s telephone member.';
          public          postgres    false    207            
           0    0    TABLE "telephoneNumber"    ACL     ?   GRANT ALL ON TABLE public."telephoneNumber" TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."telephoneNumber" TO "Manager";
          public          postgres    false    207            ?            1259    17843    ticket    TABLE     ?  CREATE TABLE public.ticket (
    "ID" character(40) NOT NULL,
    date date NOT NULL,
    "timeIssuance" time without time zone NOT NULL,
    coupon_used boolean NOT NULL,
    "totalPrice" double precision,
    "amountAccumulated" integer,
    "ID_cashier" character(9),
    "membershipCode_member" integer,
    "usesAccumulatedNumber" boolean NOT NULL,
    "quantityUsed" double precision
);
    DROP TABLE public.ticket;
       public         heap    postgres    false                       0    0    TABLE ticket    COMMENT     Y   COMMENT ON TABLE public.ticket IS 'Table where we will write information about ticket.';
          public          postgres    false    211                       0    0    COLUMN ticket."ID"    COMMENT     F   COMMENT ON COLUMN public.ticket."ID" IS 'The ticket identifier code';
          public          postgres    false    211                       0    0    COLUMN ticket.date    COMMENT     6   COMMENT ON COLUMN public.ticket.date IS 'DD/MM/YYYY';
          public          postgres    false    211                       0    0    COLUMN ticket."timeIssuance"    COMMENT     >   COMMENT ON COLUMN public.ticket."timeIssuance" IS 'HH:MM:SS';
          public          postgres    false    211                       0    0    COLUMN ticket."totalPrice"    COMMENT     ]   COMMENT ON COLUMN public.ticket."totalPrice" IS 'Total billed from the ticket
Calculated()';
          public          postgres    false    211                       0    0 !   COLUMN ticket."amountAccumulated"    COMMENT     G   COMMENT ON COLUMN public.ticket."amountAccumulated" IS 'Calculated()';
          public          postgres    false    211                       0    0 %   COLUMN ticket."usesAccumulatedNumber"    COMMENT     l   COMMENT ON COLUMN public.ticket."usesAccumulatedNumber" IS 'If the money accumulated is used (true/false)';
          public          postgres    false    211                       0    0    COLUMN ticket."quantityUsed"    COMMENT     C   COMMENT ON COLUMN public.ticket."quantityUsed" IS 'Quantity used';
          public          postgres    false    211                       0    0    TABLE ticket    ACL     ?   GRANT ALL ON TABLE public.ticket TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ticket TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ticket TO "Cashier";
          public          postgres    false    211            ?            1259    17799    worker    TABLE     5  CREATE TABLE public.worker (
    "ID" character(9) NOT NULL,
    name character(40) NOT NULL,
    phone integer NOT NULL,
    "timeTable" character(1) NOT NULL,
    "averageGrade" double precision,
    city_supermarket character(40),
    district_supermarket character(40),
    type character(40) NOT NULL
);
    DROP TABLE public.worker;
       public         heap    postgres    false                       0    0    TABLE worker    COMMENT     k   COMMENT ON TABLE public.worker IS 'Super entity.
Table where we will write the information about worker.';
          public          postgres    false    203                       0    0    COLUMN worker."ID"    COMMENT     J   COMMENT ON COLUMN public.worker."ID" IS 'ID has 8 numbers and 1 letter.';
          public          postgres    false    203                       0    0    COLUMN worker.name    COMMENT     ?   COMMENT ON COLUMN public.worker.name IS 'The worker''s name.';
          public          postgres    false    203                       0    0    COLUMN worker.phone    COMMENT     A   COMMENT ON COLUMN public.worker.phone IS 'The worker''s phone.';
          public          postgres    false    203                       0    0    COLUMN worker."timeTable"    COMMENT     F   COMMENT ON COLUMN public.worker."timeTable" IS 'Morning / Afternoon';
          public          postgres    false    203                       0    0    COLUMN worker."averageGrade"    COMMENT     B   COMMENT ON COLUMN public.worker."averageGrade" IS 'Calculated()';
          public          postgres    false    203                       0    0    COLUMN worker.type    COMMENT     i   COMMENT ON COLUMN public.worker.type IS 'Defines the type of worker. It can be Cashier or Repletener. ';
          public          postgres    false    203                       0    0    TABLE worker    ACL     ?   GRANT ALL ON TABLE public.worker TO "Administrator";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.worker TO "Manager";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.worker TO "HHRR_Manager";
          public          postgres    false    203            ?          0    17804    cashier 
   TABLE DATA           4   COPY public.cashier ("ID", "ID_worker") FROM stdin;
    public          postgres    false    204   ?       ?          0    17826    coupon 
   TABLE DATA           2   COPY public.coupon ("ID", percentage) FROM stdin;
    public          postgres    false    208   c?       ?          0    17837    discount 
   TABLE DATA           4   COPY public.discount (week, percentage) FROM stdin;
    public          postgres    false    210   ??       ?          0    17815    member 
   TABLE DATA           o   COPY public.member ("membershipCode", name, email, address, "telephoneNumer", "pointsAccumulated") FROM stdin;
    public          postgres    false    206   ۵       ?          0    17940 "   muchos_coupon_tiene_muchos_product 
   TABLE DATA           \   COPY public.muchos_coupon_tiene_muchos_product ("ID_coupon", "barCode_product") FROM stdin;
    public          postgres    false    217   ??       ?          0    17870 !   muchos_member_tiene_muchos_coupon 
   TABLE DATA           a   COPY public.muchos_member_tiene_muchos_coupon ("membershipCode_member", "ID_coupon") FROM stdin;
    public          postgres    false    214   ?       ?          0    17910 "   muchos_ticket_tiene_muchos_product 
   TABLE DATA           d   COPY public.muchos_ticket_tiene_muchos_product ("ID_ticket", "barCode_product", amount) FROM stdin;
    public          postgres    false    215   ^?       ?          0    17955 !   muchos_worker_tiene_muchos_worker 
   TABLE DATA           ]   COPY public.muchos_worker_tiene_muchos_worker ("ID_worker", "ID_worker1", grade) FROM stdin;
    public          postgres    false    218   e?       ?          0    17831    opinion 
   TABLE DATA           O   COPY public.opinion (date, "time", score, "membershipCode_member") FROM stdin;
    public          postgres    false    209   ?       ?          0    17855    phone 
   TABLE DATA           3   COPY public.phone (phone, "ID_worker") FROM stdin;
    public          postgres    false    213   ??       ?          0    17848    product 
   TABLE DATA           ?   COPY public.product ("barCode", name_product, "priceNotVAT", "priceVAT", stock, week_discount, "startDate", "endDate") FROM stdin;
    public          postgres    false    212   ?       ?          0    17809 
   repletener 
   TABLE DATA           F   COPY public.repletener ("ID", "numberHours", "ID_worker") FROM stdin;
    public          postgres    false    205   ??       ?          0    17925    returned 
   TABLE DATA           J   COPY public.returned ("barCode_product", "ID_ticket", amount) FROM stdin;
    public          postgres    false    216   ?       ?          0    17794    supermarket 
   TABLE DATA           5   COPY public.supermarket (city, district) FROM stdin;
    public          postgres    false    202   w?       ?          0    17821    telephoneNumber 
   TABLE DATA           V   COPY public."telephoneNumber" ("telephoneNumer", "membershipCode_member") FROM stdin;
    public          postgres    false    207   8?       ?          0    17843    ticket 
   TABLE DATA           ?   COPY public.ticket ("ID", date, "timeIssuance", coupon_used, "totalPrice", "amountAccumulated", "ID_cashier", "membershipCode_member", "usesAccumulatedNumber", "quantityUsed") FROM stdin;
    public          postgres    false    211   ??       ?          0    17799    worker 
   TABLE DATA           ~   COPY public.worker ("ID", name, phone, "timeTable", "averageGrade", city_supermarket, district_supermarket, type) FROM stdin;
    public          postgres    false    203   M?                  2606    17808    cashier cashier_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_pk PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashier_pk;
       public            postgres    false    204            
           2606    17976    cashier cashier_uq 
   CONSTRAINT     T   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_uq UNIQUE ("ID_worker");
 <   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashier_uq;
       public            postgres    false    204                       2606    17830    coupon coupon_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.coupon DROP CONSTRAINT coupon_pk;
       public            postgres    false    208                       2606    17842    discount discount_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pk PRIMARY KEY (week);
 >   ALTER TABLE ONLY public.discount DROP CONSTRAINT discount_pk;
       public            postgres    false    210                       2606    17820    member member_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pk PRIMARY KEY ("membershipCode");
 :   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pk;
       public            postgres    false    206            &           2606    17944 H   muchos_coupon_tiene_muchos_product muchos_coupon_tiene_muchos_product_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT muchos_coupon_tiene_muchos_product_pk PRIMARY KEY ("ID_coupon", "barCode_product");
 r   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT muchos_coupon_tiene_muchos_product_pk;
       public            postgres    false    217    217                        2606    17874 F   muchos_member_tiene_muchos_coupon muchos_member_tiene_muchos_coupon_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT muchos_member_tiene_muchos_coupon_pk PRIMARY KEY ("membershipCode_member", "ID_coupon");
 p   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT muchos_member_tiene_muchos_coupon_pk;
       public            postgres    false    214    214            "           2606    17914 H   muchos_ticket_tiene_muchos_product muchos_ticket_tiene_muchos_product_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT muchos_ticket_tiene_muchos_product_pk PRIMARY KEY ("ID_ticket", "barCode_product");
 r   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT muchos_ticket_tiene_muchos_product_pk;
       public            postgres    false    215    215            (           2606    17959 F   muchos_worker_tiene_muchos_worker muchos_worker_tiene_muchos_worker_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT muchos_worker_tiene_muchos_worker_pk PRIMARY KEY ("ID_worker", "ID_worker1");
 p   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT muchos_worker_tiene_muchos_worker_pk;
       public            postgres    false    218    218                       2606    17836    opinion opinion_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.opinion
    ADD CONSTRAINT opinion_pk PRIMARY KEY (date, "time");
 <   ALTER TABLE ONLY public.opinion DROP CONSTRAINT opinion_pk;
       public            postgres    false    209    209                       2606    17859    phone phone_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pk PRIMARY KEY ("ID_worker");
 8   ALTER TABLE ONLY public.phone DROP CONSTRAINT phone_pk;
       public            postgres    false    213                       2606    17854    product product_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY ("barCode");
 <   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pk;
       public            postgres    false    212                       2606    17814    repletener repletener_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.repletener
    ADD CONSTRAINT repletener_pk PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public.repletener DROP CONSTRAINT repletener_pk;
       public            postgres    false    205                       2606    17983    repletener repletener_uq 
   CONSTRAINT     Z   ALTER TABLE ONLY public.repletener
    ADD CONSTRAINT repletener_uq UNIQUE ("ID_worker");
 B   ALTER TABLE ONLY public.repletener DROP CONSTRAINT repletener_uq;
       public            postgres    false    205            $           2606    17929    returned returned_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT returned_pk PRIMARY KEY ("barCode_product", "ID_ticket");
 >   ALTER TABLE ONLY public.returned DROP CONSTRAINT returned_pk;
       public            postgres    false    216    216                       2606    17798    supermarket supermarket_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.supermarket
    ADD CONSTRAINT supermarket_pk PRIMARY KEY (city, district);
 D   ALTER TABLE ONLY public.supermarket DROP CONSTRAINT supermarket_pk;
       public            postgres    false    202    202                       2606    17825 "   telephoneNumber telephoneNumber_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public."telephoneNumber"
    ADD CONSTRAINT "telephoneNumber_pk" PRIMARY KEY ("membershipCode_member");
 P   ALTER TABLE ONLY public."telephoneNumber" DROP CONSTRAINT "telephoneNumber_pk";
       public            postgres    false    207                       2606    17847    ticket ticket_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pk;
       public            postgres    false    211                       2606    17803    worker worker_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_pk;
       public            postgres    false    203            >           2620    25788 +   muchos_worker_tiene_muchos_worker avg_grade    TRIGGER     ?   CREATE TRIGGER avg_grade AFTER INSERT OR UPDATE ON public.muchos_worker_tiene_muchos_worker FOR EACH ROW EXECUTE FUNCTION public.avg_grade();
 D   DROP TRIGGER avg_grade ON public.muchos_worker_tiene_muchos_worker;
       public          postgres    false    218    221            =           2620    25796    product insert_product    TRIGGER     t   CREATE TRIGGER insert_product AFTER INSERT ON public.product FOR EACH ROW EXECUTE FUNCTION public.insert_product();
 /   DROP TRIGGER insert_product ON public.product;
       public          postgres    false    220    212            <           2620    25790    product vat_price    TRIGGER     j   CREATE TRIGGER vat_price AFTER INSERT ON public.product FOR EACH ROW EXECUTE FUNCTION public.vat_price();
 *   DROP TRIGGER vat_price ON public.product;
       public          postgres    false    219    212            .           2606    17885    ticket cashier_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT cashier_fk FOREIGN KEY ("ID_cashier") REFERENCES public.cashier("ID") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.ticket DROP CONSTRAINT cashier_fk;
       public          postgres    false    211    204    3080            3           2606    17880 +   muchos_member_tiene_muchos_coupon coupon_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon") REFERENCES public.coupon("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT coupon_fk;
       public          postgres    false    208    3092    214            8           2606    17945 ,   muchos_coupon_tiene_muchos_product coupon_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon") REFERENCES public.coupon("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT coupon_fk;
       public          postgres    false    208    3092    217            0           2606    17895    product discount_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.product
    ADD CONSTRAINT discount_fk FOREIGN KEY (week_discount) REFERENCES public.discount(week) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 =   ALTER TABLE ONLY public.product DROP CONSTRAINT discount_fk;
       public          postgres    false    210    212    3096            ,           2606    17865    telephoneNumber member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public."telephoneNumber"
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public."telephoneNumber" DROP CONSTRAINT member_fk;
       public          postgres    false    3088    207    206            2           2606    17875 +   muchos_member_tiene_muchos_coupon member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT member_fk;
       public          postgres    false    206    3088    214            -           2606    17890    opinion member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.opinion
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.opinion DROP CONSTRAINT member_fk;
       public          postgres    false    3088    209    206            /           2606    17905    ticket member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.ticket DROP CONSTRAINT member_fk;
       public          postgres    false    211    206    3088            5           2606    17920 -   muchos_ticket_tiene_muchos_product product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT product_fk;
       public          postgres    false    215    212    3100            6           2606    17930    returned product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 =   ALTER TABLE ONLY public.returned DROP CONSTRAINT product_fk;
       public          postgres    false    3100    212    216            9           2606    17950 -   muchos_coupon_tiene_muchos_product product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT product_fk;
       public          postgres    false    217    3100    212            )           2606    17900    worker supermarket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT supermarket_fk FOREIGN KEY (city_supermarket, district_supermarket) REFERENCES public.supermarket(city, district) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.worker DROP CONSTRAINT supermarket_fk;
       public          postgres    false    203    3076    202    202    203            4           2606    17915 ,   muchos_ticket_tiene_muchos_product ticket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket") REFERENCES public.ticket("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT ticket_fk;
       public          postgres    false    215    211    3098            7           2606    17935    returned ticket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket") REFERENCES public.ticket("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.returned DROP CONSTRAINT ticket_fk;
       public          postgres    false    216    3098    211            1           2606    17860    phone worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.phone
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 9   ALTER TABLE ONLY public.phone DROP CONSTRAINT worker_fk;
       public          postgres    false    213    203    3078            :           2606    17960 +   muchos_worker_tiene_muchos_worker worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT worker_fk;
       public          postgres    false    3078    203    218            *           2606    17970    cashier worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 ;   ALTER TABLE ONLY public.cashier DROP CONSTRAINT worker_fk;
       public          postgres    false    204    3078    203            +           2606    17977    repletener worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.repletener
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 >   ALTER TABLE ONLY public.repletener DROP CONSTRAINT worker_fk;
       public          postgres    false    205    3078    203            ;           2606    17965 ,   muchos_worker_tiene_muchos_worker worker_fk1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT worker_fk1 FOREIGN KEY ("ID_worker1") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT worker_fk1;
       public          postgres    false    3078    218    203            ?   8   x?=ƹ?0C?X?f?9r??
???Bm??T??٥?պ26???V?a?2???l?      ?   *   x?ȱ  ??oD.b??\:vܤN6??N??Y?}??      ?   .   x?31?44?2FƜF\?F?F?\F@a i"-8??b???? ??w      ?   ?  x???=n?0???)x????8)?,??`Ӧ˄???T`?푂???b!i???~??O?73oX????J???s?GN	^=):??y??Ⳑ?7?*%????6Qq?? ȓK?`?? ߢi{$-)?.????R????t??,???,gi?+`??\SfDEh(?$<͖~K???=~3?>??$IY??t???=}hrg0R??b@??;M??ʪ? ?2?G?F? G????r? gR?\?5{???^?1??ΣqVD??d?u???H?(^=xŘn??????yieY?*
v?uKnм?#????x??G?.??????!?3+??.!ugVG?7?>҃|!V???Ai^?t?*?B?<?YZ?yE?b?(f???;??]?@
??/{?a?;??^~?fO.ܐ??k?:??N?{??8Ҏ<??ˎ6.BoT??4Kؓ`?}??B?      ?   O   x?M???0C?3?ǅ?.???T?Oɓ???F?????W???0?,[??^?VSͥ?K?J_?X??0?x??xG!      ?   I   x?M???0CѳU???C?u@4??I??&?8??H?")b.?WN??eUY?W??Wn???*?l ^b??      ?   ?   x????q?0гP?+?+?^?????|??`#?&?_???Eͣ??`R5>F??s??XzJ?\A)p???4z??E?:ʚ????@h?)|?T#ɌdTi?Z????*???x?TF???t!?.?f#D??jVME?????/GQFTY????????'?B?5!H?_???n?Q?$Ot?\n<???OA"?????â ?愠}aŊ?ny???5?je???D??}t???&?/|?'5      ?   ?   x?U?IC!C??a?O????7????J???W??;???Q,u??e?5u?P8@;і?HU8@??H?e??ǰ:?%???SW1??z,^O?~???t?[???{?"?)^ô ???(????n???|??s??_????L=???P$???'??fDy;pP?hQ6¼??AU????      ?   r   x?5??	?0?ᳲ???7????Q??????ӯэ??Hx>?Z?w???H????}!????O??3???????u?+?XX??mp???~????T?????V?}Zk?.?      ?   l   x?M?K!D?1o1ާ???NZ݁?_?4?wT9?Bai??@YZ?"0?ָ
rQ?@M?n??v?3???d?i?m???~XشΞ4???V?:^?1-G?mo??D???*?      ?   ?  x???On?@??p?9@}?7?g[?4i?1q?fJ'JD0H?m??s??IO???@??Տ?or!?6֑?*?:~?ƗT?dD2??	???h????fH???|Qҍ??8A??;??0?o?F????k_ߍgVDS?qJ?#g??[u??:?.c?}Y?V?%??m??????kh!MC?????M?0X??il?V??&\???$?۝?<{???G*???)????3?D????,݆?.?????	В_dv???(b?Ҝ6?Wiȿ??QiC6?f1?mm?o??:?*2??g???`f??ʭ??>A??Y?t?uH?!? $AƠ???
?<?tK|??????@qv??
4??]??X\?ʿ?????"?Aib??#?;R+H??S??Q      ?   F   x?=ǹ?0???˲?
?????A??f??9 ??XN4C??L?@?:¥?]E???T???>???N      ?   [   x?????0D?3Ta,$$??&c.?$r??y?aF???G???D?<??????G)`?Q2???E?ye??1Ϸ?M?Le??d??;?      ?   ?   x??ұ?0?:???,??͏mK??.a??)????????d??k?#?k!%??J?????=кhȁ??}Ч???["????OҔ???	?A??/iAԲT?y??'?<????r??h傲/vq?8m?Hm????Ph8???/?????1IIu?)?ޠ)}?      ?   H   x?5͹?0Cњ&@lQ?.???B?*?7???^I?b?Y?-?f?????
??V??D?߾??s???I?      ?   ?  x???In!E?p?\???b?q??:'????I?j?m?h!=????????06 I??`( ???`.??Z???/??=?=,????f????qC?4?????K??-?L졻ds???yC?4K???kݝ?a??I`c?H?x?K??{???????X??F?+?t>n?i ?f?gW>?x+???ە???"Շ?T????|?h??y??Z?U??'??I?V???!????{4?8????f/??+f9??h?1???c???????z??"Y??q?ݎP?O?ګ????(C 9???? ?3?p=??8??o?۴??0?ve?w?ߧq?
?:_Ƥ??8??????X?~???W??m?1?H=t??pF ??\???y?u??ۺ<a??6??᪽?WfÀ3Ȕp~+?(q??Z3?      ?   ?  x?ŔMN?0?דS???8vҥ?BP	u??!?J$7AnAb?Qz V!?N?J???EV3?o?g?(??TFa??0K99L O?W???k\S?ܡ???}k??H?e?X?(??C??_д?n??	?K??>?T|?4j?[???	??????x??l,n?c(CHq???3??an??*l?????{o??d??????V?{z/??~???+B?k3^u??FaJ?p?2???~?JI1?,s?#????????l?G??$x?Ͻ.@Z?nOp???؁?M?֭)æJc?o?C ??q&?b3l??+??b???9?6???D??*xv@s???턞o??^7??y??	b??x6eM9??_?v??U??a,?Z?S ?!?N?1Eځ??v??i???Y?Z????k7???X????8?2?}E?'N?j     