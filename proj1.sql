create table Customers (
    phone   integer,     
    [address] text, 
    cust_id integer,
    [name]    text,
    email   text,
    primary key (cust_id)
);

create table Course_packages (
    price                   integer not null,   
    [name]                    text not null,
    sale_end_date           date not null,
    num_free_registrations  integer not null,
    package_id              integer,   
    sale_start_date         date not null,
    primary key (package_id),
    check (price >= 0 and num_free_registrations >= 0)
);

create table Credit_cards (
    [expiry_date] date not null,
    [number]      integer,     
    CVV         integer not null,
    from_date   date,
    cust_id     integer not null,
    primary key (number /*cust_id ??*/)
    foreign key (cust_id) references Customers(cust_id) 
);



create table Buys (
    [date]                        date,
    num_remaining_redemptions   integer not null,
    package_id                  integer,
    [number]                      integer,
    -- cust_id                  integer not null,
    primary key (date, package_id, number),
    foreign key (package_id) references Course_packages(package_id),
    foreign key (number) references Credit_cards(number),
    -- foreign key (cust_id) references Customers(cust_id) or Credit_cards?,
    check (num_remaining_redemptions >= 0)    
);
