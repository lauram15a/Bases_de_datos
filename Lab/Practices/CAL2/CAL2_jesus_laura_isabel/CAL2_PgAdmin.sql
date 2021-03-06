PGDMP     .    3                w            CAL2    12.0    12.0 y    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17021    CAL2    DATABASE     d   CREATE DATABASE "CAL2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "CAL2";
                postgres    false            ?            1259    17027    worker    TABLE       CREATE TABLE public.worker (
    "ID" character(9) NOT NULL,
    name character(40) NOT NULL,
    phone integer NOT NULL,
    "timeTable" character(1) NOT NULL,
    city_supermarket character(40),
    district_supermarket character(40),
    type character(40) NOT NULL
);
    DROP TABLE public.worker;
       public         heap    postgres    false            ?           0    0    TABLE worker    COMMENT     k   COMMENT ON TABLE public.worker IS 'Super entity.
Table where we will write the information about worker.';
          public          postgres    false    203            ?           0    0    COLUMN worker."ID"    COMMENT     J   COMMENT ON COLUMN public.worker."ID" IS 'ID has 8 numbers and 1 letter.';
          public          postgres    false    203            ?           0    0    COLUMN worker.name    COMMENT     ?   COMMENT ON COLUMN public.worker.name IS 'The worker''s name.';
          public          postgres    false    203            ?           0    0    COLUMN worker.phone    COMMENT     A   COMMENT ON COLUMN public.worker.phone IS 'The worker''s phone.';
          public          postgres    false    203            ?           0    0    COLUMN worker."timeTable"    COMMENT     F   COMMENT ON COLUMN public.worker."timeTable" IS 'Morning / Afternoon';
          public          postgres    false    203            ?           0    0    COLUMN worker.type    COMMENT     i   COMMENT ON COLUMN public.worker.type IS 'Defines the type of worker. It can be Cashier or Repletener. ';
          public          postgres    false    203            ?            1259    17032    cashier    TABLE     P   CREATE TABLE public.cashier (
    "ID" character(9)
)
INHERITS (public.worker);
    DROP TABLE public.cashier;
       public         heap    postgres    false    203            ?           0    0    TABLE cashier    COMMENT     ?   COMMENT ON TABLE public.cashier IS 'Sub entity.
Casier is a tipe of worker.
Table where we will write information about cashier.';
          public          postgres    false    204            ?           0    0    COLUMN cashier."ID"    COMMENT     J   COMMENT ON COLUMN public.cashier."ID" IS 'ID has 8 numbers and 1 letter';
          public          postgres    false    204            ?            1259    17054    coupon    TABLE     [   CREATE TABLE public.coupon (
    "ID" integer NOT NULL,
    percentage integer NOT NULL
);
    DROP TABLE public.coupon;
       public         heap    postgres    false            ?           0    0    TABLE coupon    COMMENT     Y   COMMENT ON TABLE public.coupon IS 'Table where we will write information about coupon.';
          public          postgres    false    208            ?           0    0    COLUMN coupon."ID"    COMMENT     B   COMMENT ON COLUMN public.coupon."ID" IS 'The ID of each coupon.';
          public          postgres    false    208            ?            1259    17065    discount    TABLE     g   CREATE TABLE public.discount (
    week integer NOT NULL,
    percentage integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.discount;
       public         heap    postgres    false            ?           0    0    TABLE discount    COMMENT     ]   COMMENT ON TABLE public.discount IS 'Table where we will write information about discount.';
          public          postgres    false    210            ?           0    0    COLUMN discount.week    COMMENT     Q   COMMENT ON COLUMN public.discount.week IS 'The number of the week of the year.';
          public          postgres    false    210            ?           0    0    COLUMN discount.percentage    COMMENT     @   COMMENT ON COLUMN public.discount.percentage IS '0 <= x < 100';
          public          postgres    false    210            ?            1259    17043    member    TABLE     ?   CREATE TABLE public.member (
    "membershipCode" integer NOT NULL,
    name character(40) NOT NULL,
    email character(40) NOT NULL,
    address character(40) NOT NULL,
    "telephoneNumer" integer,
    "pointsAccumulated" integer DEFAULT 0 NOT NULL
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
          public          postgres    false    206            ?            1259    17168 "   muchos_coupon_tiene_muchos_product    TABLE     ?   CREATE TABLE public.muchos_coupon_tiene_muchos_product (
    "ID_coupon" integer NOT NULL,
    "barCode_product" integer NOT NULL
);
 6   DROP TABLE public.muchos_coupon_tiene_muchos_product;
       public         heap    postgres    false            ?            1259    17098 !   muchos_member_tiene_muchos_coupon    TABLE     ?   CREATE TABLE public.muchos_member_tiene_muchos_coupon (
    "membershipCode_member" integer NOT NULL,
    "ID_coupon" integer NOT NULL
);
 5   DROP TABLE public.muchos_member_tiene_muchos_coupon;
       public         heap    postgres    false            ?            1259    17138 "   muchos_ticket_tiene_muchos_product    TABLE     ?   CREATE TABLE public.muchos_ticket_tiene_muchos_product (
    "ID_ticket" character(40) NOT NULL,
    "barCode_product" integer NOT NULL,
    amount integer NOT NULL
);
 6   DROP TABLE public.muchos_ticket_tiene_muchos_product;
       public         heap    postgres    false            ?           0    0 0   COLUMN muchos_ticket_tiene_muchos_product.amount    COMMENT     o   COMMENT ON COLUMN public.muchos_ticket_tiene_muchos_product.amount IS 'Quantity of the product in the ticket';
          public          postgres    false    215            ?            1259    17183 !   muchos_worker_tiene_muchos_worker    TABLE     ?   CREATE TABLE public.muchos_worker_tiene_muchos_worker (
    "ID_worker" character(9) NOT NULL,
    "ID_worker1" character(9) NOT NULL,
    grade double precision NOT NULL
);
 5   DROP TABLE public.muchos_worker_tiene_muchos_worker;
       public         heap    postgres    false            ?           0    0 .   COLUMN muchos_worker_tiene_muchos_worker.grade    COMMENT     ?   COMMENT ON COLUMN public.muchos_worker_tiene_muchos_worker.grade IS 'Each worker is assigned an average grade as a result of an evaluation carried out on him by the rest of his colleagues.';
          public          postgres    false    218            ?            1259    17059    opinion    TABLE     ?   CREATE TABLE public.opinion (
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
          public          postgres    false    209            ?            1259    17083    phone    TABLE     X   CREATE TABLE public.phone (
    phone integer,
    "ID_worker" character(9) NOT NULL
);
    DROP TABLE public.phone;
       public         heap    postgres    false            ?           0    0    TABLE phone    COMMENT     E   COMMENT ON TABLE public.phone IS 'Multivalued attribute of worker.';
          public          postgres    false    213            ?           0    0    COLUMN phone.phone    COMMENT     @   COMMENT ON COLUMN public.phone.phone IS 'The worker''s phone.';
          public          postgres    false    213            ?            1259    17076    product    TABLE       CREATE TABLE public.product (
    "barCode" integer NOT NULL,
    name_product character(40) NOT NULL,
    "priceVAT" real DEFAULT 0 NOT NULL,
    "priceNotVAT" real DEFAULT 0 NOT NULL,
    week_discount integer,
    "startDate" date,
    "endDate" date
);
    DROP TABLE public.product;
       public         heap    postgres    false            ?           0    0    TABLE product    COMMENT     [   COMMENT ON TABLE public.product IS 'Table where we will write information about product.';
          public          postgres    false    212            ?           0    0    COLUMN product."barCode"    COMMENT     N   COMMENT ON COLUMN public.product."barCode" IS 'The bar code of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product."priceVAT"    COMMENT     P   COMMENT ON COLUMN public.product."priceVAT" IS 'The price Vat of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product."priceNotVAT"    COMMENT     W   COMMENT ON COLUMN public.product."priceNotVAT" IS 'The price not VAT of the product.';
          public          postgres    false    212            ?           0    0    COLUMN product."startDate"    COMMENT     D   COMMENT ON COLUMN public.product."startDate" IS 'Date of starting';
          public          postgres    false    212            ?           0    0    COLUMN product."endDate"    COMMENT     N   COMMENT ON COLUMN public.product."endDate" IS 'Date of death  of the coupon';
          public          postgres    false    212            ?            1259    17037 
   repletener    TABLE     ?   CREATE TABLE public.repletener (
    "ID" character(9),
    "numberHours" integer DEFAULT 1 NOT NULL
)
INHERITS (public.worker);
    DROP TABLE public.repletener;
       public         heap    postgres    false    203            ?           0    0    TABLE repletener    COMMENT     ?   COMMENT ON TABLE public.repletener IS 'Sub entity.
It is a tipe of worker.
Table where we will write information about repletener.';
          public          postgres    false    205            ?           0    0    COLUMN repletener."ID"    COMMENT     F   COMMENT ON COLUMN public.repletener."ID" IS '8 numbers and 1 letter';
          public          postgres    false    205            ?           0    0    COLUMN repletener."numberHours"    COMMENT     g   COMMENT ON COLUMN public.repletener."numberHours" IS 'It must be less than 24 hours and more than 0.';
          public          postgres    false    205            ?            1259    17153    returned    TABLE     ?   CREATE TABLE public.returned (
    "barCode_product" integer NOT NULL,
    "ID_ticket" character(40) NOT NULL,
    amount integer NOT NULL
);
    DROP TABLE public.returned;
       public         heap    postgres    false            ?           0    0    COLUMN returned.amount    COMMENT     N   COMMENT ON COLUMN public.returned.amount IS 'Amount of the product returned';
          public          postgres    false    216            ?            1259    17022    supermarket    TABLE     j   CREATE TABLE public.supermarket (
    city character(40) NOT NULL,
    district character(40) NOT NULL
);
    DROP TABLE public.supermarket;
       public         heap    postgres    false            ?           0    0    TABLE supermarket    COMMENT     i   COMMENT ON TABLE public.supermarket IS 'Table where we will insert information about the supermarket. ';
          public          postgres    false    202            ?           0    0    COLUMN supermarket.city    COMMENT     B   COMMENT ON COLUMN public.supermarket.city IS 'Name of the city.';
          public          postgres    false    202            ?           0    0    COLUMN supermarket.district    COMMENT     c   COMMENT ON COLUMN public.supermarket.district IS 'Name of the district where the supermarket is.';
          public          postgres    false    202            ?            1259    17049    telephoneNumber    TABLE     v   CREATE TABLE public."telephoneNumber" (
    "telephoneNumer" integer,
    "membershipCode_member" integer NOT NULL
);
 %   DROP TABLE public."telephoneNumber";
       public         heap    postgres    false            ?           0    0    TABLE "telephoneNumber"    COMMENT     q   COMMENT ON TABLE public."telephoneNumber" IS 'Table of the maltivalued attribute of member''s telephoneNumber.';
          public          postgres    false    207            ?           0    0 )   COLUMN "telephoneNumber"."telephoneNumer"    COMMENT     b   COMMENT ON COLUMN public."telephoneNumber"."telephoneNumer" IS 'The member''s telephone member.';
          public          postgres    false    207            ?            1259    17071    ticket    TABLE     p  CREATE TABLE public.ticket (
    "ID" character(40) NOT NULL,
    date date NOT NULL,
    "timeIssuance" time without time zone NOT NULL,
    coupon_used boolean NOT NULL,
    total_price double precision NOT NULL,
    "ID_cashier" character(9),
    "membershipCode_member" integer,
    "usesAccumulatedNumber" boolean NOT NULL,
    "quantityUsed" double precision
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            ?           0    0    TABLE ticket    COMMENT     Y   COMMENT ON TABLE public.ticket IS 'Table where we will write information about ticket.';
          public          postgres    false    211            ?           0    0    COLUMN ticket."ID"    COMMENT     F   COMMENT ON COLUMN public.ticket."ID" IS 'The ticket identifier code';
          public          postgres    false    211            ?           0    0    COLUMN ticket.date    COMMENT     6   COMMENT ON COLUMN public.ticket.date IS 'DD/MM/YYYY';
          public          postgres    false    211            ?           0    0    COLUMN ticket."timeIssuance"    COMMENT     >   COMMENT ON COLUMN public.ticket."timeIssuance" IS 'HH:MM:SS';
          public          postgres    false    211            ?           0    0 %   COLUMN ticket."usesAccumulatedNumber"    COMMENT     l   COMMENT ON COLUMN public.ticket."usesAccumulatedNumber" IS 'If the money accumulated is used (true/false)';
          public          postgres    false    211            ?           0    0    COLUMN ticket."quantityUsed"    COMMENT     C   COMMENT ON COLUMN public.ticket."quantityUsed" IS 'Quantity used';
          public          postgres    false    211            ?          0    17032    cashier 
   TABLE DATA           o   COPY public.cashier ("ID", name, phone, "timeTable", city_supermarket, district_supermarket, type) FROM stdin;
    public          postgres    false    204   d?       ?          0    17054    coupon 
   TABLE DATA           2   COPY public.coupon ("ID", percentage) FROM stdin;
    public          postgres    false    208   K?       ?          0    17065    discount 
   TABLE DATA           4   COPY public.discount (week, percentage) FROM stdin;
    public          postgres    false    210   ??       ?          0    17043    member 
   TABLE DATA           o   COPY public.member ("membershipCode", name, email, address, "telephoneNumer", "pointsAccumulated") FROM stdin;
    public          postgres    false    206   Ì       ?          0    17168 "   muchos_coupon_tiene_muchos_product 
   TABLE DATA           \   COPY public.muchos_coupon_tiene_muchos_product ("ID_coupon", "barCode_product") FROM stdin;
    public          postgres    false    217   ??       ?          0    17098 !   muchos_member_tiene_muchos_coupon 
   TABLE DATA           a   COPY public.muchos_member_tiene_muchos_coupon ("membershipCode_member", "ID_coupon") FROM stdin;
    public          postgres    false    214   ??       ?          0    17138 "   muchos_ticket_tiene_muchos_product 
   TABLE DATA           d   COPY public.muchos_ticket_tiene_muchos_product ("ID_ticket", "barCode_product", amount) FROM stdin;
    public          postgres    false    215   E?       ?          0    17183 !   muchos_worker_tiene_muchos_worker 
   TABLE DATA           ]   COPY public.muchos_worker_tiene_muchos_worker ("ID_worker", "ID_worker1", grade) FROM stdin;
    public          postgres    false    218   L?       ?          0    17059    opinion 
   TABLE DATA           O   COPY public.opinion (date, "time", score, "membershipCode_member") FROM stdin;
    public          postgres    false    209   ?       ?          0    17083    phone 
   TABLE DATA           3   COPY public.phone (phone, "ID_worker") FROM stdin;
    public          postgres    false    213   ??       ?          0    17076    product 
   TABLE DATA           |   COPY public.product ("barCode", name_product, "priceVAT", "priceNotVAT", week_discount, "startDate", "endDate") FROM stdin;
    public          postgres    false    212   ?       ?          0    17037 
   repletener 
   TABLE DATA           ?   COPY public.repletener ("ID", name, phone, "timeTable", city_supermarket, district_supermarket, type, "numberHours") FROM stdin;
    public          postgres    false    205   ??       ?          0    17153    returned 
   TABLE DATA           J   COPY public.returned ("barCode_product", "ID_ticket", amount) FROM stdin;
    public          postgres    false    216   ??       ?          0    17022    supermarket 
   TABLE DATA           5   COPY public.supermarket (city, district) FROM stdin;
    public          postgres    false    202   ??       ?          0    17049    telephoneNumber 
   TABLE DATA           V   COPY public."telephoneNumber" ("telephoneNumer", "membershipCode_member") FROM stdin;
    public          postgres    false    207   ??       ?          0    17071    ticket 
   TABLE DATA           ?   COPY public.ticket ("ID", date, "timeIssuance", coupon_used, total_price, "ID_cashier", "membershipCode_member", "usesAccumulatedNumber", "quantityUsed") FROM stdin;
    public          postgres    false    211   ?       ?          0    17027    worker 
   TABLE DATA           n   COPY public.worker ("ID", name, phone, "timeTable", city_supermarket, district_supermarket, type) FROM stdin;
    public          postgres    false    203   ė                  2606    17036    cashier cashier_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_pk PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public.cashier DROP CONSTRAINT cashier_pk;
       public            postgres    false    204                       2606    17058    coupon coupon_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.coupon DROP CONSTRAINT coupon_pk;
       public            postgres    false    208                       2606    17070    discount discount_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pk PRIMARY KEY (week);
 >   ALTER TABLE ONLY public.discount DROP CONSTRAINT discount_pk;
       public            postgres    false    210            	           2606    17048    member member_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pk PRIMARY KEY ("membershipCode");
 :   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pk;
       public            postgres    false    206                       2606    17172 H   muchos_coupon_tiene_muchos_product muchos_coupon_tiene_muchos_product_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT muchos_coupon_tiene_muchos_product_pk PRIMARY KEY ("ID_coupon", "barCode_product");
 r   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT muchos_coupon_tiene_muchos_product_pk;
       public            postgres    false    217    217                       2606    17102 F   muchos_member_tiene_muchos_coupon muchos_member_tiene_muchos_coupon_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT muchos_member_tiene_muchos_coupon_pk PRIMARY KEY ("membershipCode_member", "ID_coupon");
 p   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT muchos_member_tiene_muchos_coupon_pk;
       public            postgres    false    214    214                       2606    17142 H   muchos_ticket_tiene_muchos_product muchos_ticket_tiene_muchos_product_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT muchos_ticket_tiene_muchos_product_pk PRIMARY KEY ("ID_ticket", "barCode_product");
 r   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT muchos_ticket_tiene_muchos_product_pk;
       public            postgres    false    215    215            !           2606    17187 F   muchos_worker_tiene_muchos_worker muchos_worker_tiene_muchos_worker_pk 
   CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT muchos_worker_tiene_muchos_worker_pk PRIMARY KEY ("ID_worker", "ID_worker1");
 p   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT muchos_worker_tiene_muchos_worker_pk;
       public            postgres    false    218    218                       2606    17064    opinion opinion_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.opinion
    ADD CONSTRAINT opinion_pk PRIMARY KEY (date, "time");
 <   ALTER TABLE ONLY public.opinion DROP CONSTRAINT opinion_pk;
       public            postgres    false    209    209                       2606    17087    phone phone_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pk PRIMARY KEY ("ID_worker");
 8   ALTER TABLE ONLY public.phone DROP CONSTRAINT phone_pk;
       public            postgres    false    213                       2606    17082    product product_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY ("barCode");
 <   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pk;
       public            postgres    false    212                       2606    17042    repletener repletener_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.repletener
    ADD CONSTRAINT repletener_pk PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public.repletener DROP CONSTRAINT repletener_pk;
       public            postgres    false    205                       2606    17157    returned returned_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT returned_pk PRIMARY KEY ("barCode_product", "ID_ticket");
 >   ALTER TABLE ONLY public.returned DROP CONSTRAINT returned_pk;
       public            postgres    false    216    216                       2606    17026    supermarket supermarket_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.supermarket
    ADD CONSTRAINT supermarket_pk PRIMARY KEY (city, district);
 D   ALTER TABLE ONLY public.supermarket DROP CONSTRAINT supermarket_pk;
       public            postgres    false    202    202                       2606    17053 "   telephoneNumber telephoneNumber_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public."telephoneNumber"
    ADD CONSTRAINT "telephoneNumber_pk" PRIMARY KEY ("membershipCode_member");
 P   ALTER TABLE ONLY public."telephoneNumber" DROP CONSTRAINT "telephoneNumber_pk";
       public            postgres    false    207                       2606    17075    ticket ticket_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pk;
       public            postgres    false    211                       2606    17031    worker worker_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pk PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_pk;
       public            postgres    false    203            %           2606    17113    ticket cashier_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT cashier_fk FOREIGN KEY ("ID_cashier") REFERENCES public.cashier("ID") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.ticket DROP CONSTRAINT cashier_fk;
       public          postgres    false    3077    211    204            *           2606    17108 +   muchos_member_tiene_muchos_coupon coupon_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon") REFERENCES public.coupon("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT coupon_fk;
       public          postgres    false    214    208    3085            /           2606    17173 ,   muchos_coupon_tiene_muchos_product coupon_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT coupon_fk FOREIGN KEY ("ID_coupon") REFERENCES public.coupon("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT coupon_fk;
       public          postgres    false    208    217    3085            '           2606    17123    product discount_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.product
    ADD CONSTRAINT discount_fk FOREIGN KEY (week_discount) REFERENCES public.discount(week) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 =   ALTER TABLE ONLY public.product DROP CONSTRAINT discount_fk;
       public          postgres    false    3089    210    212            #           2606    17093    telephoneNumber member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public."telephoneNumber"
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public."telephoneNumber" DROP CONSTRAINT member_fk;
       public          postgres    false    206    3081    207            )           2606    17103 +   muchos_member_tiene_muchos_coupon member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_member_tiene_muchos_coupon DROP CONSTRAINT member_fk;
       public          postgres    false    3081    206    214            $           2606    17118    opinion member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.opinion
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.opinion DROP CONSTRAINT member_fk;
       public          postgres    false    3081    206    209            &           2606    17133    ticket member_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT member_fk FOREIGN KEY ("membershipCode_member") REFERENCES public.member("membershipCode") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.ticket DROP CONSTRAINT member_fk;
       public          postgres    false    211    206    3081            ,           2606    17148 -   muchos_ticket_tiene_muchos_product product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT product_fk;
       public          postgres    false    212    3093    215            -           2606    17158    returned product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 =   ALTER TABLE ONLY public.returned DROP CONSTRAINT product_fk;
       public          postgres    false    216    3093    212            0           2606    17178 -   muchos_coupon_tiene_muchos_product product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product
    ADD CONSTRAINT product_fk FOREIGN KEY ("barCode_product") REFERENCES public.product("barCode") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.muchos_coupon_tiene_muchos_product DROP CONSTRAINT product_fk;
       public          postgres    false    212    217    3093            "           2606    17128    worker supermarket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.worker
    ADD CONSTRAINT supermarket_fk FOREIGN KEY (city_supermarket, district_supermarket) REFERENCES public.supermarket(city, district) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.worker DROP CONSTRAINT supermarket_fk;
       public          postgres    false    203    202    203    202    3073            +           2606    17143 ,   muchos_ticket_tiene_muchos_product ticket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product
    ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket") REFERENCES public.ticket("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_ticket_tiene_muchos_product DROP CONSTRAINT ticket_fk;
       public          postgres    false    3091    215    211            .           2606    17163    returned ticket_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.returned
    ADD CONSTRAINT ticket_fk FOREIGN KEY ("ID_ticket") REFERENCES public.ticket("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 <   ALTER TABLE ONLY public.returned DROP CONSTRAINT ticket_fk;
       public          postgres    false    216    211    3091            (           2606    17088    phone worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.phone
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;
 9   ALTER TABLE ONLY public.phone DROP CONSTRAINT worker_fk;
       public          postgres    false    213    203    3075            1           2606    17188 +   muchos_worker_tiene_muchos_worker worker_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT worker_fk FOREIGN KEY ("ID_worker") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT worker_fk;
       public          postgres    false    218    3075    203            2           2606    17193 ,   muchos_worker_tiene_muchos_worker worker_fk1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker
    ADD CONSTRAINT worker_fk1 FOREIGN KEY ("ID_worker1") REFERENCES public.worker("ID") MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.muchos_worker_tiene_muchos_worker DROP CONSTRAINT worker_fk1;
       public          postgres    false    3075    218    203            ?   ?   x?œK?0@??)zC??uAŅn]??Q?Z?э?? ?<???TjB?[ϛ?LZ?$H??e?4 ??A?+?+? 4??=qr2?h?	"G?"?T5????@柞#?	MyQz??ؑ?????? F痣?_?8V ??ᣀy'?X??<u?Aچ??:?MO?1]?????+I?^=z??d}o?C?4t?H]??ZV)??i?n??????ҏ? ?;k?      ?   *   x?ȱ  ??oD.b??\:vܤN6??N??Y?}??      ?   .   x?31?44?2FƜF\?F?F?\F@a i"-8??b???? ??w      ?   ?  x????N?0???S?	??O?Q*PV?kj?TN\?D7	???Ű?	???Eپ?>???c`?Z!]?????? ?x???i|f??^????.?? ?E?qR?)DqB?)?????\u(|*??=N??͋n???/?ta?x
<rU7????)????d?#?hЖ??Z???Y^???1I??R?z?;?????ϊ?$?????M???1?NCk?K?)p?+4'?x?h??<?M?Z?r???piY??l
??FH?:~???>?[?ղ?o??5[?ZOEӟ?$a@?)?֕??k?y??Y??3???߸???z??8???y?Ad??)`eЮY?w?1?`eЮ?O?Y)
????[?(M??$ ?)v?[??e}????T?ɰ?<?t??Y㕜????,DA@?`x?J??A????Y?\?O-?X??
?????<1B?VB?      ?   O   x?M???0C?3?ǅ?.???T?Oɓ???F?????W???0?,[??^?VSͥ?K?J_?X??0?x??xG!      ?   I   x?M???0CѳU???C?u@4??I??&?8??H?")b.?WN??eUY?W??Wn???*?l ^b??      ?   ?   x????q?0гP?+?+?^?????|??`#?&?_???Eͣ??`R5>F??s??XzJ?\A)p???4z??E?:ʚ????@h?)|?T#ɌdTi?Z????*???x?TF???t!?.?f#D??jVME?????/GQFTY????????'?B?5!H?_???n?Q?$Ot?\n<???OA"?????â ?愠}aŊ?ny???5?je???D??}t???&?/|?'5      ?   ?   x?U?IC!C??a?O????7????J???W??;???Q,u??e?5u?P8@;і?HU8@??H?e??ǰ:?%???SW1??z,^O?~???t?[???{?"?)^ô ???(????n???|??s??_????L=???P$???'??fDy;pP?hQ6¼??AU????      ?   r   x?5??	?0?ᳲ???7????Q??????ӯэ??Hx>?Z?w???H????}!????O??3???????u?+?XX??mp???~????T?????V?}Zk?.?      ?   l   x?M?K!D?1o1ާ???NZ݁?_?4?wT9?Bai??@YZ?"0?ָ
rQ?@M?n??v?3???d?i?m???~XشΞ4???V?:^?1-G?mo??D???*?      ?   p  x???Kn?0??9?P,?`o?J??(??m6.?
???v?k?=BoғtL??E a4???3B*??ƒ?ƻ7???i??Dp?11??4XFpE9??oW???N?(?2AT???u0 ???=w??rЄ?1c@?X
?y????j}??C????'0c???kci)U??ڵtu????#*f-~??N21ױPc)!?F????Ǵ?K?5?ܜ?:?M?V/?Ev??1%K??!????J??T??G??|??CS??lN?1A????V??P?a?@??;?????A?t??|Cp?????ξ?قaЀ?I?=a?$/.;?'W?????PX߅D¬&B?$?n
??5P}????L????$t???YE?&??      ?   ?   x?Œ?n?0?g?)?TĎ2?*P"U???&?t1??y?S?/V?H??C?p??I?????,H<????l?s!?&???0?Xc٣?l{????:?????z\?Z䜚!O??M??j/?ž?'?M
???I?@?}?h1dIְ??>;?Kq?/I??K?_?㮃ɋk;`%?M?????h.
?귷!]^?~?E ͸???????ct?_|NN?R???"???JeB?????>3???R??ǧ?      ?   [   x?????0D?3Ta,$$??&c.?$r??y?aF???G???D?<??????G)`?Q2???E?ye??1Ϸ?M?Le??d??;?      ?   ?   x??ұ?0?:???,??͏mK??.a??)????????d??k?#?k!%??J?????=кhȁ??}Ч???["????OҔ???	?A??/iAԲT?y??'?<????r??h傲/vq?8m?Hm????Ph8???/?????1IIu?)?ޠ)}?      ?   H   x?5͹?0Cњ&@lQ?.???B?*?7???^I?b?Y?-?f?????
??V??D?߾??s???I?      ?   ?  x????m?0D?Ti?????T?ϩ ?#?-)
???x ?C?gIw?0RؐU@?R???L{ n? ?W?w{u%??eä?B???@1
-R?F???Ѩ?@?'??? ??+v9E̋????b|v܁/Pz???!/???Rg+??y? ??I?*?[q??iC USs? ??'??Ż??;?[>P=?s????T??(?tP???iH??T?l???F?;??]	r?ꊘ@?|??0????^v?Ѹ ??,v'???B????????:?~?8????N8??6????;N??3|?0?y??ۮc??ced???e?uY???d??\=??LT???f??;?ij=?2??q????.U????6?74???i?????Z??@?.?"??-?m?F???m?T?????? ??4?g?u???9?]b&      ?     x?ŕMn?0?דS?TI?8?t??Z?*???F2Ie?J]?(?U????gY<?H?EV?F????0<K?@??T?[??'K,tYLs???n???:y?U????v???2:?5n??ߤ?9?w?w??:??sM??'??& ???<#'<?/yb5a?)t??]?Z???
-+?L}$?s????5?b?h`?3*G??B??M??_??s??o??Z͡?V???W??GW?O???TN??+*????t???y?=z?N????pKq???????J]0??GVϰ??Yvb7e??yIA7????????7?%?Z?=N?i?F|ѥ.?e7??u?w?,???Y,???̆?$?(??p	?J??u??C??~Ϯ?>x??? _     