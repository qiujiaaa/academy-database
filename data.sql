

--populate Course_packages table
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (5, 'Artificial Intelligence', '2024-01-10', 4, 1, '2020-08-26');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (10, 'Machine Learning', '2023-02-16', 10, 2, '2018-07-28');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (16, 'Cyber Security', '2022-05-05', 12, 3, '2021-02-28');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (12, 'Software Engineering', '2023-05-07', 16, 4, '2019-03-10');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (3, 'Database', '2023-01-17', 20, 5, '2019-01-06');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (33, 'Data Structure', '2022-11-15', 7, 6, '2018-09-27');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (333, 'Algorithms', '2024-01-31', 1, 7, '2021-07-05');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (11, 'Networks', '2023-07-01', 5, 8, '2020-07-29');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (21, 'Operating Systems', '2023-10-09', 9, 9, '2021-03-18');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (43, 'Computer Graphics', '2023-06-16', 15, 10, '2021-11-28');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (76, 'Parallel Computing', '2023-03-26', 2, 11, '2019-10-16');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (30, 'Multimedia', '2023-08-10', 11, 12, '2020-02-20');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (50, 'Programming Languages', '2022-10-13', 10, 13, '2020-03-05');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (53, 'Distributed Systems', '2022-11-20', 17, 14, '2019-02-26');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (45, 'Computer Security', '2023-06-25', 15, 15, '2020-08-26');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (37, 'Computer Games', '2022-12-03', 13, 16, '2021-12-04');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (43, 'Programming Methodology', '2023-07-29', 19, 17, '2020-05-25');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (11, 'Discrete Structures', '2022-11-20', 16, 18, '2019-08-20');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (10, 'Statistics', '2024-02-27', 9, 19, '2019-04-16');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (5, 'Calculus', '2023-08-19', 2, 20, '2018-06-04');

insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (100, 'Computer Security', '2023-08-19', 2, 21, '2018-06-04');
insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (150, 'Discrete Structures', '2023-08-19', 2, 22, '2018-06-04');


BEGIN TRANSACTION;
--populate Customers table
insert into Customers (phone, address, cust_id, name, email) values ('7095098098', '65 Fairview Parkway', 1, 'Jaymie', null);
insert into Customers (phone, address, cust_id, name, email) values ('7198884633', '92 Briar Crest Court', 2, 'Dallas', 'dbeatens1@imageshack.us');
insert into Customers (phone, address, cust_id, name, email) values ('6612840580', '17 Pepper Wood Junction', 3, 'Anna-maria', 'abarford2@bloglines.com');
insert into Customers (phone, address, cust_id, name, email) values ('2035245598', '373 Anzinger Place', 4, 'Noland', 'namphlett3@wordpress.org');
insert into Customers (phone, address, cust_id, name, email) values (null, '07356 Banding Lane', 5, 'Marie-ann', 'mstange4@noaa.gov');
insert into Customers (phone, address, cust_id, name, email) values ('9994711549', '886 Farragut Crossing', 6, 'Putnam', 'pfowley5@mayoclinic.com');
insert into Customers (phone, address, cust_id, name, email) values ('8106375428', '2051 Clove Place', 7, 'Merrielle', 'mpau6@rambler.ru');
insert into Customers (phone, address, cust_id, name, email) values ('2268117881', '271 Clove Crossing', 8, 'Etty', 'egrosvener7@tumblr.com');
insert into Customers (phone, address, cust_id, name, email) values (null, '4 Canary Hill', 9, 'Idell', 'ileith8@hexun.com');
insert into Customers (phone, address, cust_id, name, email) values ('1965627597', '03 Montana Circle', 10, 'Keelia', 'kweiner9@mysql.com');
insert into Customers (phone, address, cust_id, name, email) values ('9863884211', '313 Gulseth Street', 11, 'Willa', 'wgrinyakina@meetup.com');
insert into Customers (phone, address, cust_id, name, email) values ('7977072151', '0214 Bobwhite Trail', 12, 'Chad', 'cmccroryb@ask.com');
insert into Customers (phone, address, cust_id, name, email) values (null, '03312 Transport Road', 13, 'Duane', 'dbrainsbyc@wikimedia.org');
insert into Customers (phone, address, cust_id, name, email) values ('6253313513', '04 Pearson Trail', 14, 'Alica', 'acrouchd@wix.com');
insert into Customers (phone, address, cust_id, name, email) values ('1812040319', '55 Maple Wood Center', 15, 'Franky', 'fmartinote@acquirethisname.com');
insert into Customers (phone, address, cust_id, name, email) values ('7322168950', '310 Tennyson Plaza', 16, 'Hewe', 'hspelmanf@xinhuanet.com');
insert into Customers (phone, address, cust_id, name, email) values ('6369470528', '4 Stang Drive', 17, 'Willow', null);
insert into Customers (phone, address, cust_id, name, email) values ('7355498293', '905 Rowland Point', 18, 'Myron', 'mverrierh@hostgator.com');
insert into Customers (phone, address, cust_id, name, email) values ('2256194455', '9 Ludington Circle', 19, 'Elset', 'esoani@prlog.org');
insert into Customers (phone, address, cust_id, name, email) values ('3674501285', '1 Grasskamp Junction', 20, 'Kit', 'kreekj@reverbnation.com');

--populate Credit_cards table
insert into Credit_cards (expiry_date, number, CVV) values ('2022-08-10', '4175003665378449', '946');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-12-27', '5453645393112118', '200');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-06-01', '560222549646904780', '491');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-03-03', '3533846600792838', '776');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-01-13', '374283312104573', '760');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-12-29', '630458284476134458', '820');
insert into Credit_cards (expiry_date, number, CVV) values ('2024-05-28', '564182540168178440', '319');
insert into Credit_cards (expiry_date, number, CVV) values ('2025-10-08', '3567052898252853', '278');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-07-18', '30000532068750', '915');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-11-28', '56022292947227624', '432');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-03-15', '3531724438465020', '632');
insert into Credit_cards (expiry_date, number, CVV) values ('2025-08-03', '4041370974024', '861');
insert into Credit_cards (expiry_date, number, CVV) values ('2025-10-18', '3530018806140112', '601');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-12-04', '5344807003529486', '628');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-07-12', '5018377800024433', '889');
insert into Credit_cards (expiry_date, number, CVV) values ('2024-07-19', '6759274606121255374', '102');
insert into Credit_cards (expiry_date, number, CVV) values ('2024-06-21', '374283174987222', '776');
insert into Credit_cards (expiry_date, number, CVV) values ('2022-12-26', '5018681020026476334', '042');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-08-23', '3542502207619705', '898');
insert into Credit_cards (expiry_date, number, CVV) values ('2024-03-24', '201880497763070', '414');
insert into Credit_cards (expiry_date, number, CVV) values ('2023-03-03', '211880497763070', '333');

--populate Owns table
insert into Owns (from_date, number, cust_id) values ('2017-05-25', '4175003665378449', 1);
insert into Owns (from_date, number, cust_id) values ('2017-05-19', '5453645393112118', 2);
insert into Owns (from_date, number, cust_id) values ('2018-03-08', '560222549646904780', 3);
insert into Owns (from_date, number, cust_id) values ('2019-06-24', '3533846600792838', 4);
insert into Owns (from_date, number, cust_id) values ('2018-03-12', '374283312104573', 5);
insert into Owns (from_date, number, cust_id) values ('2018-04-04', '630458284476134458', 6);
insert into Owns (from_date, number, cust_id) values ('2018-12-01', '564182540168178440', 7);
insert into Owns (from_date, number, cust_id) values ('2018-01-11', '3567052898252853', 8);
insert into Owns (from_date, number, cust_id) values ('2018-04-05', '30000532068750', 9);
insert into Owns (from_date, number, cust_id) values ('2018-04-12', '56022292947227624', 10);
insert into Owns (from_date, number, cust_id) values ('2017-12-19', '3531724438465020', 11);
insert into Owns (from_date, number, cust_id) values ('2016-02-21', '4041370974024', 12);
insert into Owns (from_date, number, cust_id) values ('2015-05-02', '3530018806140112', 13);
insert into Owns (from_date, number, cust_id) values ('2015-05-31', '5344807003529486', 14);
insert into Owns (from_date, number, cust_id) values ('2016-03-29', '5018377800024433', 15);
insert into Owns (from_date, number, cust_id) values ('2017-10-04', '6759274606121255374', 16);
insert into Owns (from_date, number, cust_id) values ('2018-09-14', '374283174987222', 17);
insert into Owns (from_date, number, cust_id) values ('2018-12-01', '5018681020026476334', 18);
insert into Owns (from_date, number, cust_id) values ('2018-03-21', '3542502207619705', 19);
insert into Owns (from_date, number, cust_id) values ('2018-08-13', '201880497763070', 20);
insert into Owns (from_date, number, cust_id) values ('2018-10-13', '211880497763070', 20); -- multiple credit card owned by 1 person: id 20
COMMIT;

--populate Buys table
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-05-24', 1, 1, '4175003665378449');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-09-14', 2, 2, '560222549646904780');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2022-01-21', 12, 3, '374283312104573');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-07-15', 3, 4, '6759274606121255374');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-11-02', 8, 5, '5018681020026476334');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-09-05', 7, 6, '3542502207619705');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-04-04', 0, 7, '374283174987222');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-04-06', 5, 8, '5344807003529486');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-10-21', 2, 9, '4175003665378449');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-11-02', 3, 10, '3531724438465020');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-11-25', 1, 11, '3530018806140112');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-10-27', 1, 12, '6759274606121255374');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-08-29', 7, 13, '4041370974024');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-05-04', 3, 14, '56022292947227624');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2022-01-01', 7, 15, '3531724438465020');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-08-31', 1, 16, '564182540168178440');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-04-11', 1, 17, '201880497763070');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-05-26', 13, 18, '564182540168178440');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-04-26', 6, 19, '560222549646904780');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2021-03-20', 2, 20, '560222549646904780');

insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2020-08-20', 2, 21, '4175003665378449');
insert into Buys (date, num_remaining_redemptions, package_id, number) values ('2020-07-20', 2, 22, '560222549646904780');

--populate Employees table
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (1, 'Galen', '429 Parkside Junction', 'gyepiskopov0@google.com.au', '2495996139', '2010-09-11', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (2, 'Rubie', '1 Moulton Park', 'randersen1@unc.edu', '8269709108', '2016-03-14', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (3, 'Ahmad', '5 New Castle Trail', 'aspreull2@icq.com', '9251836354', '2002-01-16', '2003-02-14');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (4, 'Lauren', '20 Miller Point', 'ldunnett3@taobao.com', '8732293388', '2006-05-02', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (5, 'Andriana', '8 Monterey Plaza', 'aduffin4@webs.com', '1486338564', '2012-12-09', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (6, 'Shirl', '19 Carey Trail', 'sboshier5@yandex.ru', '6801104330', '2014-04-30', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (7, 'Ewen', '3 Mcbride Place', 'ebonafant6@ovh.net', '9636857315', '2003-08-25', '2016-10-18');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (8, 'Arman', '2830 Fuller Circle', 'abaudrey7@yahoo.co.jp', '6581089478', '2016-10-03', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (9, 'Elfie', '29354 Morning Plaza', 'esaltsberger8@skyrock.com', '5561151260', '2002-04-09', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (10, 'Caz', '31 Gale Junction', 'csnellman9@tmall.com', '9937184305', '2007-07-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (11, 'Sydney', '122 Melody Point', 'sstoffera@mozilla.com', '5302350951', '2007-04-30', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (12, 'Urbano', '81508 Merry Alley', 'uudenb@unicef.org', '1419518628', '2017-08-21', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (13, 'Robyn', '8374 Westridge Street', 'rsudronc@blogspot.com', '5126369891', '2005-12-18', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (14, 'Conni', '116 Killdeer Parkway', 'cseymourd@blogspot.com', '1361520629', '2010-05-14', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (15, 'Adah', '677 Heffernan Place', 'adalwise@a8.net', '3837845968', '2011-11-05', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (16, 'Lucita', '3393 Schurz Alley', 'ljellyf@bizjournals.com', '7932487750', '2002-01-24', '2012-03-28');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (17, 'Wait', '11219 Cardinal Court', 'wridolfog@facebook.com', '4682228375', '2000-09-13', '2005-10-30');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (18, 'Caddric', '99804 Melvin Point', 'cperuttoh@edublogs.org', '6824057253', '2009-06-08', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (19, 'Colette', '4085 Sullivan Point', 'cbroomheadi@google.ru', '6847222949', '2018-03-06', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (20, 'Helene', '8291 Miller Avenue', 'hadamssonj@hud.gov', '2934865236', '2008-08-11', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (21, 'Sutherland', '3 Algoma Place', 'szorenerk@wiley.com', '5102894849', '2018-01-07', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (22, 'Niles', '17847 Spenser Point', 'nwhittockl@washingtonpost.com', '4511009595', '2010-06-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (23, 'Angelina', '96 Hoepker Point', 'ahaddickm@foxnews.com', '7908962072', '2007-05-06', '2010-02-10');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (24, 'Merrily', '419 Jay Crossing', 'mcamillin@behance.net', '1231911043', '2020-09-18', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (25, 'Packston', '48849 Elka Parkway', 'peakeno@prnewswire.com', '2262530062', '2015-01-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (26, 'Geri', '71014 Sutherland Road', 'ggrinsteadp@goodreads.com', '9645006330', '2006-01-10', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (27, 'Gran', '91 Summit Street', 'gtremmilq@berkeley.edu', '2722711417', '2003-12-01', '2007-03-16');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (28, 'Millie', '1 Aberg Junction', 'mranscombr@indiegogo.com', '1391439710', '2004-06-20', '2018-03-08');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (29, 'Georgie', '41 Ludington Court', 'gbalhams@jiathis.com', '1814498106', '2020-05-18', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (30, 'Randolph', '1 Mayer Street', 'rbrowert@dell.com', '6435170149', '2019-04-19', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (31, 'Alleyn', '3555 Service Place', 'adiddamsu@kickstarter.com', '8448680920', '2008-01-03', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (32, 'Kinna', '216 Ohio Park', 'khuccabyv@furl.net', '3815873216', '2016-06-07', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (33, 'Judy', '21 Mifflin Way', 'jmatteviw@moonfruit.com', '9955078034', '2019-07-17', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (34, 'Dorthy', '73 Autumn Leaf Terrace', 'dgreatbanksx@yahoo.co.jp', '5382223637', '2020-07-17', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (35, 'Flinn', '20 Lakewood Junction', 'ftorbecky@tripadvisor.com', '6163506969', '2020-01-11', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (36, 'Cyrille', '029 Union Place', 'cberendsenz@symantec.com', '2756443944', '2015-01-17', '2018-06-08');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (37, 'Ky', '5474 Ludington Alley', 'kransbury10@google.fr', '4573881316', '2003-10-24', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (38, 'Broderick', '7692 Muir Circle', 'bderby11@alibaba.com', '7372490932', '2001-06-25', '2008-07-07');
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (39, 'Rabi', '3 Pennsylvania Place', 'rmoryson12@yellowbook.com', '1103173676', '2004-09-30', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (40, 'Shannen', '29 Lakewood Way', 'sbendon13@squidoo.com', '3917771249', '2018-07-28', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (41, 'Oliver', '4 Granby Avenue', 'oknott14@yelp.com', '4972700544', '2020-04-08', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (42, 'Georgi', '66 Forest Lane', 'gmaxfield15@amazon.co.uk', '7639853634', '2017-06-06', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (43, 'Aeriell', '299 Banding Park', 'amanford16@sciencedirect.com', '8352097102', '2012-04-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (44, 'Marianne', '6461 Mockingbird Parkway', 'mfalls17@indiatimes.com', '7672556360', '2011-01-23', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (45, 'Hayward', '2718 Pleasure Court', 'hmcgee18@amazon.co.jp', '7713532181', '2015-07-25', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (46, 'Burt', '1 Butternut Road', 'bcantwell19@sina.com.cn', '3152123865', '2015-03-01', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (47, 'Hettie', '2 Loomis Crossing', 'hgalgey1a@51.la', '8507748803', '2014-02-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (48, 'Bobette', '6614 Lerdahl Trail', 'bcelloni1b@wired.com', '1144716169', '2012-07-04', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (49, 'Jeniffer', '87030 Lerdahl Crossing', 'jdomican1c@delicious.com', '7152598478', '2010-07-17', null);
insert into Employees (eid, name, address, email, phone, join_date, depart_date) values (50, 'Blakeley', '133 Walton Court', 'bsplaven1d@hubpages.com', '8532476317', '2016-12-28', null);

--populate Pay_slips table
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (1, '2020-08-18 03:06:59', 4401, null, 21);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (2, '2020-11-24 23:21:58', 3589, null, 28);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (4, '2020-12-07 02:39:50', 4912, null, 25);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (8, '2020-03-06 01:59:18', 3015, null, 16);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (15, '2020-06-09 21:55:51', 3937, null, 23);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (18, '2020-07-19 09:56:28', 1898, null, 17);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (20, '2020-03-28 01:13:04', 3362, null, 29);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (24, '2021-03-11 21:15:55', 2537, null, 19);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (29, '2020-10-01 08:15:37', 1109, null, 10);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (31, '2020-02-03 16:22:04', 1518, 13, null);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (35, '2020-07-28 00:38:31', 3300, 30, null);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (39, '2020-06-13 21:52:03', 566, 18, null);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (40, '2020-03-07 02:14:03', 754, 13, null);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (44, '2020-09-27 01:56:00', 655, 10, null);
insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (49, '2021-03-03 02:13:51', 1068, 29, null);

--populate Full_time_Emp table
insert into Full_time_Emp (eid, monthly_salary) values (1, 3665);
insert into Full_time_Emp (eid, monthly_salary) values (2, 9390);
insert into Full_time_Emp (eid, monthly_salary) values (3, 8511);
insert into Full_time_Emp (eid, monthly_salary) values (4, 2296);
insert into Full_time_Emp (eid, monthly_salary) values (5, 3578);
insert into Full_time_Emp (eid, monthly_salary) values (6, 7753);
insert into Full_time_Emp (eid, monthly_salary) values (7, 9451);
insert into Full_time_Emp (eid, monthly_salary) values (8, 3943);
insert into Full_time_Emp (eid, monthly_salary) values (9, 4697);
insert into Full_time_Emp (eid, monthly_salary) values (10, 2670);
insert into Full_time_Emp (eid, monthly_salary) values (11, 6955);
insert into Full_time_Emp (eid, monthly_salary) values (12, 9169);
insert into Full_time_Emp (eid, monthly_salary) values (13, 9039);
insert into Full_time_Emp (eid, monthly_salary) values (14, 7211);
insert into Full_time_Emp (eid, monthly_salary) values (15, 3539);
insert into Full_time_Emp (eid, monthly_salary) values (16, 3660);
insert into Full_time_Emp (eid, monthly_salary) values (17, 8519);
insert into Full_time_Emp (eid, monthly_salary) values (18, 4669);
insert into Full_time_Emp (eid, monthly_salary) values (19, 8196);
insert into Full_time_Emp (eid, monthly_salary) values (20, 4893);
insert into Full_time_Emp (eid, monthly_salary) values (21, 5939);
insert into Full_time_Emp (eid, monthly_salary) values (22, 9896);
insert into Full_time_Emp (eid, monthly_salary) values (23, 2435);
insert into Full_time_Emp (eid, monthly_salary) values (24, 6954);
insert into Full_time_Emp (eid, monthly_salary) values (25, 4274);
insert into Full_time_Emp (eid, monthly_salary) values (26, 6306);
insert into Full_time_Emp (eid, monthly_salary) values (27, 7835);
insert into Full_time_Emp (eid, monthly_salary) values (28, 2479);
insert into Full_time_Emp (eid, monthly_salary) values (29, 2297);
insert into Full_time_Emp (eid, monthly_salary) values (30, 6541);
insert into Full_time_Emp (eid, monthly_salary) values (31, 3351);
insert into Full_time_Emp (eid, monthly_salary) values (32, 4554);
insert into Full_time_Emp (eid, monthly_salary) values (33, 1681);
insert into Full_time_Emp (eid, monthly_salary) values (34, 8468);
insert into Full_time_Emp (eid, monthly_salary) values (35, 1465);
insert into Full_time_Emp (eid, monthly_salary) values (36, 9841);
insert into Full_time_Emp (eid, monthly_salary) values (37, 6541);
insert into Full_time_Emp (eid, monthly_salary) values (38, 3254);

--populate Part_time_Emp table
insert into Part_time_Emp (eid, hourly_rate) values (39, 12);
insert into Part_time_Emp (eid, hourly_rate) values (40, 16);
insert into Part_time_Emp (eid, hourly_rate) values (41, 16);
insert into Part_time_Emp (eid, hourly_rate) values (42, 17);
insert into Part_time_Emp (eid, hourly_rate) values (43, 14);
insert into Part_time_Emp (eid, hourly_rate) values (44, 12);
insert into Part_time_Emp (eid, hourly_rate) values (45, 8);
insert into Part_time_Emp (eid, hourly_rate) values (46, 18);
insert into Part_time_Emp (eid, hourly_rate) values (47, 9);
insert into Part_time_Emp (eid, hourly_rate) values (48, 9);
insert into Part_time_Emp (eid, hourly_rate) values (49, 13);
insert into Part_time_Emp (eid, hourly_rate) values (50, 15);

--populate Instructors table
insert into Instructors (eid) values (1);
insert into Instructors (eid) values (2);
insert into Instructors (eid) values (3);
insert into Instructors (eid) values (4);
insert into Instructors (eid) values (5);
insert into Instructors (eid) values (6);
insert into Instructors (eid) values (7);
insert into Instructors (eid) values (8);
insert into Instructors (eid) values (9);
insert into Instructors (eid) values (10);
insert into Instructors (eid) values (11);
insert into Instructors (eid) values (12);
insert into Instructors (eid) values (13);
insert into Instructors (eid) values (39);
insert into Instructors (eid) values (40);
insert into Instructors (eid) values (41);
insert into Instructors (eid) values (42);
insert into Instructors (eid) values (43);
insert into Instructors (eid) values (44);
insert into Instructors (eid) values (45);
insert into Instructors (eid) values (46);
insert into Instructors (eid) values (47);
insert into Instructors (eid) values (48);
insert into Instructors (eid) values (49);
insert into Instructors (eid) values (50);

--populate Full_time_instructors table
insert into Full_time_instructors (eid) values (1);
insert into Full_time_instructors (eid) values (2);
insert into Full_time_instructors (eid) values (3);
insert into Full_time_instructors (eid) values (4);
insert into Full_time_instructors (eid) values (5);
insert into Full_time_instructors (eid) values (6);
insert into Full_time_instructors (eid) values (7);
insert into Full_time_instructors (eid) values (8);
insert into Full_time_instructors (eid) values (9);
insert into Full_time_instructors (eid) values (10);
insert into Full_time_instructors (eid) values (11);
insert into Full_time_instructors (eid) values (12);
insert into Full_time_instructors (eid) values (13);

--populate Part_time_instructors table
insert into Part_time_instructors (eid) values (39);
insert into Part_time_instructors (eid) values (40);
insert into Part_time_instructors (eid) values (41);
insert into Part_time_instructors (eid) values (42);
insert into Part_time_instructors (eid) values (43);
insert into Part_time_instructors (eid) values (44);
insert into Part_time_instructors (eid) values (45);
insert into Part_time_instructors (eid) values (46);
insert into Part_time_instructors (eid) values (47);
insert into Part_time_instructors (eid) values (48);
insert into Part_time_instructors (eid) values (49);
insert into Part_time_instructors (eid) values (50);

-- populate Administrators table
insert into Administrators (eid) values (14);
insert into Administrators (eid) values (15);
insert into Administrators (eid) values (16);
insert into Administrators (eid) values (17);
insert into Administrators (eid) values (18);
insert into Administrators (eid) values (19);
insert into Administrators (eid) values (20);
insert into Administrators (eid) values (21);
insert into Administrators (eid) values (22);
insert into Administrators (eid) values (23);
insert into Administrators (eid) values (24);
insert into Administrators (eid) values (25);

-- populate Managers table
insert into Managers (eid) values (26);
insert into Managers (eid) values (27);
insert into Managers (eid) values (28);
insert into Managers (eid) values (29);
insert into Managers (eid) values (30);
insert into Managers (eid) values (31);
insert into Managers (eid) values (32);
insert into Managers (eid) values (33);
insert into Managers (eid) values (34);
insert into Managers (eid) values (35);
insert into Managers (eid) values (36);
insert into Managers (eid) values (37);
insert into Managers (eid) values (38);

-- populate Course_areas table
insert into Course_areas (name, eid) values ('Networking', 26);
insert into Course_areas (name, eid) values ('Operating Systems', 28);
insert into Course_areas (name, eid) values ('Parallel Computing', 28);
insert into Course_areas (name, eid) values ('Database Systems', 30);
insert into Course_areas (name, eid) values ('Statistics', 31);
insert into Course_areas (name, eid) values ('Computer Security', 32);
insert into Course_areas (name, eid) values ('Algorithms', 33);
insert into Course_areas (name, eid) values ('Software Engineering', 33);
insert into Course_areas (name, eid) values ('Distributed Algorithms', 34);
insert into Course_areas (name, eid) values ('AI', 35);
insert into Course_areas (name, eid) values ('Machine Learning', 36);
insert into Course_areas (name, eid) values ('Calculus', 37);

-- populate Specializes table
insert into Specializes (eid, course_area) values (1, 'Networking');
insert into Specializes (eid, course_area) values (1, 'Database Systems');
insert into Specializes (eid, course_area) values (2, 'Algorithms');
insert into Specializes (eid, course_area) values (3, 'AI');
insert into Specializes (eid, course_area) values (4, 'Database Systems');
insert into Specializes (eid, course_area) values (5, 'Networking');
insert into Specializes (eid, course_area) values (5, 'AI');
insert into Specializes (eid, course_area) values (5, 'Algorithms');
insert into Specializes (eid, course_area) values (6, 'Statistics');
insert into Specializes (eid, course_area) values (7, 'Networking');
insert into Specializes (eid, course_area) values (8, 'Networking');
insert into Specializes (eid, course_area) values (9, 'Database Systems');
insert into Specializes (eid, course_area) values (10, 'Machine Learning');
insert into Specializes (eid, course_area) values (11, 'Networking');
insert into Specializes (eid, course_area) values (12, 'Statistics');
insert into Specializes (eid, course_area) values (13, 'Algorithms');
insert into Specializes (eid, course_area) values (13, 'Networking');
insert into Specializes (eid, course_area) values (39, 'Parallel Computing');
insert into Specializes (eid, course_area) values (40, 'Calculus');
insert into Specializes (eid, course_area) values (41, 'Software Engineering');
insert into Specializes (eid, course_area) values (41, 'Parallel Computing');
insert into Specializes (eid, course_area) values (41, 'Statistics');
insert into Specializes (eid, course_area) values (42, 'Distributed Algorithms');
insert into Specializes (eid, course_area) values (43, 'Computer Security');
insert into Specializes (eid, course_area) values (43, 'AI');
insert into Specializes (eid, course_area) values (44, 'Computer Security');
insert into Specializes (eid, course_area) values (45, 'Distributed Algorithms');
insert into Specializes (eid, course_area) values (46, 'Calculus');
insert into Specializes (eid, course_area) values (47, 'Parallel Computing');
insert into Specializes (eid, course_area) values (47, 'AI');
insert into Specializes (eid, course_area) values (48, 'Software Engineering');
insert into Specializes (eid, course_area) values (49, 'Computer Security');
insert into Specializes (eid, course_area) values (50, 'Operating Systems');

-- populate Courses
insert into Courses (course_id, title, description, course_area, duration) values (1, 'Data Structures and Algorithms', 'It continues the introduction and emphasises object-oriented programming with application to complex data structures.', 'Algorithms', 2);
insert into Courses (course_id, title, description, course_area, duration) values (2, 'Introduction to Information Security', 'This module serves as an introductory module on information security.', 'Computer Security', 2);
insert into Courses (course_id, title, description, course_area, duration) values (3, 'Programming Methodology', 'It explores two modern programming paradigms, object-oriented programming and functional programming.', 'Algorithms', 2);
insert into Courses (course_id, title, description, course_area, duration) values (4, 'Database Systems', 'The aim of this module is to introduce the fundamental concepts and techniques necessary for the understanding and practice of design and implementation of database applications and of the management of data with relational database management systems.', 'Database Systems', 2);
insert into Courses (course_id, title, description, course_area, duration) values (5, 'Introduction to Computer Networks', null, 'Networking', 2);
insert into Courses (course_id, title, description, course_area, duration) values (6, 'Introduction to Operating Systems', null, 'Operating Systems', 2);
insert into Courses (course_id, title, description, course_area, duration) values (7, 'Software Engineering Project', null, 'Software Engineering', 2);
insert into Courses (course_id, title, description, course_area, duration) values (8, 'Parallel Computing', 'The aim of this module is to provide an introduction to the field of parallel computing with hands-on parallel programming experience on real parallel machines.', 'Parallel Computing', 2);
insert into Courses (course_id, title, description, course_area, duration) values (9, 'Operating Systems Design and Pragmatics', 'This module builds upon the conceptual foundation formed and extends it to the study of real-life operating systems.', 'Software Engineering', 2);
insert into Courses (course_id, title, description, course_area, duration) values (10, 'Introduction to Artificial Intelligence', 'The module introduces the basic concepts in search and knowledge representation as well as to a number of sub-areas of artificial intelligence.', 'AI', 2);
insert into Courses (course_id, title, description, course_area, duration) values (11, 'Machine Learning', 'This module introduces basic concepts and algorithms in machine learning and neural networks.', 'Machine Learning', 4);
insert into Courses (course_id, title, description, course_area, duration) values (12, 'Probability and Statistics', 'Basic concepts of probability, conditional probability, independence, random variables, joint and marginal distributions, mean and variance, some common probability distributions, sampling distributions, estimation and hypothesis testing based on a normal population.', 'Statistics', 4);
insert into Courses (course_id, title, description, course_area, duration) values (13, 'Calculus for Computing', 'This module provides a basic foundation for calculus and its related subjects required by computing students.', 'Calculus', 4);

-- populate Offerings
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (1, '2020-06-09', 500.50, 90, '2020-08-01', '2020-08-15', '2020-11-30', 14, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (1, '2020-01-01', 500.50, 90, '2020-01-15', '2020-02-01', '2020-05-30', 14, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (2, '2019-08-01', 810.99, 190, '2020-01-01', '2020-01-15', '2020-04-30', 15, 200);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (4, '2019-03-23', 888.10, 80, '2019-05-06', '2019-05-20', '2019-08-02', 17, 100);
--insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (4, '2020-03-23', 888, 300, '2020-05-06', '2020-05-20', '2020-08-02', 17, 371);
--insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (4, '2021-03-23', 920, 300, '2021-05-06', '2021-05-20', '2021-08-02', 20, 381);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (5, '2019-08-25', 802.99, 90, '2019-09-23', '2020-01-01', '2020-04-23', 21, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (6, '2021-06-06', 606.00, 90, '2021-07-01', '2021-08-02', '2021-12-12', 22, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (7, '2020-07-17', 127.00, 95, '2020-07-30', '2020-09-02', '2020-12-21', 22, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (8, '2018-05-25', 525.55, 150, '2018-06-10', '2018-07-07', '2018-10-10', 24, 200);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (9, '2020-01-01', 825.66, 80, '2020-02-01', '2020-02-20', '2020-06-06', 25, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (9, '2021-07-17', 127.00, 90, '2021-07-30', '2021-09-02', '2021-12-21', 22, 100);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (11, '2023-02-14', 1314.00, 180, '2023-03-15', '2023-04-20', '2023-06-30', 21, 200);
insert into Offerings(course_id, launch_date, fees, target_number_registrations, registration_deadline, start_date, end_date, eid, seating_capacity) values (13, '2020-08-14', 564.00, 190, '2020-09-15', '2020-10-20', '2021-03-30', 17, 200);

-- populate Rooms
insert into Rooms(rid, location, seating_capacity) values (1, '01-01', 50);
insert into Rooms(rid, location, seating_capacity) values (2, '01-02', 50);
insert into Rooms(rid, location, seating_capacity) values (3, '01-03', 50);
insert into Rooms(rid, location, seating_capacity) values (4, '01-04', 50);
insert into Rooms(rid, location, seating_capacity) values (5, '01-05', 50);
insert into Rooms(rid, location, seating_capacity) values (6, '01-06', 50);
insert into Rooms(rid, location, seating_capacity) values (7, '01-07', 50);
insert into Rooms(rid, location, seating_capacity) values (8, '01-08', 50);
insert into Rooms(rid, location, seating_capacity) values (9, '01-09', 50);
insert into Rooms(rid, location, seating_capacity) values (10, '01-10', 50);
insert into Rooms(rid, location, seating_capacity) values (11, '02-01', 100);
insert into Rooms(rid, location, seating_capacity) values (12, '02-02', 100);
insert into Rooms(rid, location, seating_capacity) values (13, '02-03', 100);
insert into Rooms(rid, location, seating_capacity) values (14, '02-04', 100);
insert into Rooms(rid, location, seating_capacity) values (15, '02-05', 100);
insert into Rooms(rid, location, seating_capacity) values (16, '03-01', 100);
insert into Rooms(rid, location, seating_capacity) values (17, '03-02', 100);
insert into Rooms(rid, location, seating_capacity) values (18, '03-03', 100);
insert into Rooms(rid, location, seating_capacity) values (19, '03-04', 100);
insert into Rooms(rid, location, seating_capacity) values (20, '03-05', 100);

--populate Sessions
BEGIN TRANSACTION;
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (1, '2020-06-09', 1, '09:00', '11:00', '2020-08-15');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (1, '2020-06-09', 2, '09:00', '11:00', '2020-11-30');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (1, '2020-01-01', 1, '09:00', '11:00', '2020-02-01');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (1, '2020-01-01', 2, '09:00', '11:00', '2020-05-30');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (2, '2019-08-01', 1, '14:00', '16:00', '2020-01-15');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (2, '2019-08-01', 2, '14:00', '16:00', '2020-04-30');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (4, '2019-03-23', 1, '16:00', '18:00', '2019-05-20');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (4, '2019-03-23', 2, '16:00', '18:00', '2019-08-02');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (5, '2019-08-25', 1, '10:00', '12:00', '2020-01-01');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (5, '2019-08-25', 2, '10:00', '12:00', '2020-04-23');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (6, '2021-06-06', 1, '16:00', '18:00', '2021-08-02');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (6, '2021-06-06', 2, '16:00', '18:00', '2021-12-12');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (7, '2020-07-17', 1, '14:00', '16:00', '2020-09-02');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (7, '2020-07-17', 2, '14:00', '16:00', '2020-12-21');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (8, '2018-05-25', 1, '09:00', '11:00', '2018-07-07');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (8, '2018-05-25', 2, '09:00', '11:00', '2018-10-10');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (9, '2020-01-01', 1, '10:00', '12:00', '2020-02-20');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (9, '2020-01-01', 2, '10:00', '12:00', '2020-06-06');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (9, '2021-07-17', 1, '10:00', '12:00', '2021-09-02');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (9, '2021-07-17', 2, '10:00', '12:00', '2021-12-21');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (11, '2023-02-14', 1, '14:00', '18:00', '2023-04-20');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (11, '2023-02-14', 2, '14:00', '18:00', '2023-06-30');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (13, '2020-08-14', 1, '14:00', '18:00', '2020-10-20');
insert into Sessions(course_id, launch_date, sid, start_time, end_time, date) values (13, '2020-08-14', 2, '14:00', '18:00', '2021-04-06');

--populate Conducts

insert into Conducts(course_id, launch_date, sid, rid, eid) values (1, '2020-06-09', 1, 1, 2);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (1, '2020-06-09', 2, 1, 5);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (1, '2020-01-01', 1, 3, 13);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (1, '2020-01-01', 2, 3, 13);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (2, '2019-08-01', 1, 11, 43);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (2, '2019-08-01', 2, 11, 44);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (4, '2019-03-23', 1, 9, 1);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (4, '2019-03-23', 2, 9, 4);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (5, '2019-08-25', 1, 6, 8);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (5, '2019-08-25', 2, 6, 5);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (6, '2021-06-06', 1, 7, 50);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (6, '2021-06-06', 2, 7, 50);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (7, '2020-07-17', 1, 8, 41);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (7, '2020-07-17', 2, 8, 48);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (8, '2018-05-25', 1, 19, 39);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (8, '2018-05-25', 2, 19, 41);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (9, '2020-01-01', 1, 5, 48);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (9, '2020-01-01', 2, 5, 48);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (9, '2021-07-17', 1, 7, 41);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (9, '2021-07-17', 2, 7, 41);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (11, '2023-02-14', 1, 13, 10);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (11, '2023-02-14', 2, 13, 10);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (13, '2020-08-14', 1, 20, 46);
insert into Conducts(course_id, launch_date, sid, rid, eid) values (13, '2020-08-14', 2, 20, 40);
COMMIT;

--populate Registers
insert into Registers(course_id, launch_date, sid, number, date) values (1, '2020-06-09', 1, '4175003665378449', '2020-08-01');
insert into Registers(course_id, launch_date, sid, number, date) values (1, '2020-06-09', 1, '5453645393112118', '2020-08-01');
insert into Registers(course_id, launch_date, sid, number, date) values (1, '2020-06-09', 1, '3567052898252853', '2020-08-01');
insert into Registers(course_id, launch_date, sid, number, date) values (5, '2019-08-25', 2, '3567052898252853', '2019-09-20');
insert into Registers(course_id, launch_date, sid, number, date) values (5, '2019-08-25', 2, '4175003665378449', '2019-09-21');
insert into Registers(course_id, launch_date, sid, number, date) values (5, '2019-08-25', 2, '5018377800024433', '2019-09-22');
insert into Registers(course_id, launch_date, sid, number, date) values (8, '2018-05-25', 1, '4175003665378449', '2018-05-30');
insert into Registers(course_id, launch_date, sid, number, date) values (8, '2018-05-25', 2, '5018377800024433', '2018-06-01');
insert into Registers(course_id, launch_date, sid, number, date) values (8, '2018-05-25', 1, '3531724438465020', '2018-06-07');
insert into Registers(course_id, launch_date, sid, number, date) values (13, '2020-08-14', 2, '374283312104573', '2020-09-13');
insert into Registers(course_id, launch_date, sid, number, date) values (13, '2020-08-14', 2, '374283174987222', '2020-09-14');
insert into Registers(course_id, launch_date, sid, number, date) values (13, '2020-08-14', 2, '201880497763070', '2020-09-14');
insert into Registers(course_id, launch_date, sid, number, date) values (9, '2020-01-01', 1, '3567052898252853', '2020-01-30');
insert into Registers(course_id, launch_date, sid, number, date) values (9, '2020-01-01', 1, '5018681020026476334', '2020-01-20');
insert into Registers(course_id, launch_date, sid, number, date) values (9, '2020-01-01', 1, '3531724438465020', '2020-01-21');
insert into Registers(course_id, launch_date, sid, number, date) values (1, '2020-01-01', 1, '3531724438465020', '2020-01-11');
insert into Registers(course_id, launch_date, sid, number, date) values (1, '2020-01-01', 1, '5018377800024433', '2020-01-05');

-- populate Redeems
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 1, '2021-04-26', 19, '560222549646904780', '2021-07-18');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 1, '2021-07-15', 4, '6759274606121255374', '2021-07-19');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 1, '2021-05-26', 18, '564182540168178440', '2021-07-18');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 2, '2021-04-06', 8, '5344807003529486', '2021-07-18');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 2, '2021-04-11', 17, '201880497763070', '2021-07-19');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (9, '2021-07-17', 2, '2021-05-04', 14, '56022292947227624', '2021-07-18');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (6, '2021-06-06', 1, '2021-05-24', 1, '4175003665378449', '2021-06-07');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (6, '2021-06-06', 1, '2021-05-26', 18, '564182540168178440', '2021-06-08');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (6, '2021-06-06', 2, '2021-04-06', 8, '5344807003529486', '2021-06-10');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (6, '2021-06-06', 2, '2021-04-26', 19, '560222549646904780', '2021-06-11');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (13, '2020-08-14', 1, '2020-08-20', 21, '4175003665378449', '2020-09-14');
insert into Redeems(course_id, launch_date, sid, date, package_id, number, redeems_date) values (13, '2020-08-14', 1, '2020-07-20', 22, '560222549646904780', '2020-08-25');

-- populate Cancels
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (1, '2020-06-09', 1, 1, '2020-06-21', 450.45, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (1, '2020-06-09', 1, 2, '2020-06-15', 450.45, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (1, '2020-06-09', 1, 8, '2020-06-17', 450.45, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (5, '2019-08-25', 2, 8, '2020-08-26', 722.70, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (5, '2019-08-25', 2, 1, '2020-09-01', 722.70, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (5, '2019-08-25', 2, 15, '2020-09-03', 722.70, false);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (6, '2021-06-06', 1, 1, '2021-06-15', 0, true);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (6, '2021-06-06', 1, 7, '2021-06-10', 0, true);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (9, '2021-07-17', 1, 3, '2021-07-24', 0, true);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (9, '2021-07-17', 1, 16, '2021-07-23', 0, true);
insert into Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) values (9, '2021-07-17', 1, 7, '2021-07-27', 0, true);
