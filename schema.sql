-- add on to drop table if exist ....  cascade?
drop table if exists Customers, Course_packages, Credit_cards, Buys, Employees, Pay_slips, Full_time_Emp, Part_time_Emp, Instructors, Full_time_Emp, Part_time_Emp Administrators, Managers, Course_areas, Specializes, Courses, Offerings cascade;

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
    primary key (number /*cust_id ??*/),
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


/*
Constraints not satisfied:
- An Employee can only be Full_time_Emp OR Part_time_Emp, cannot be both
- An Employee is not necessary an Instructor
- An Instructor can only be Full_time_instructors OR Part_time_instructors, cannot be both
*/

create table Employees (
    eid         integer primary key,
    name        text,
    address     text,
    email       text,
    phone       text,
    join_date   date,
    depart_date date,
);

create table Pay_slips (
    eid             integer references Employees
                    on delete cascade,
    payment_date    date,
    amount          integer,
    num_work_hours  integer,
    num_work_days   integer,
    primary key (eid, payment_date)
);

create table Full_time_Emp (
    eid             integer primary key references Employees
                    on delete cascade,
    monthly_salary  integer
);

create table Part_time_Emp (
    eid             integer primary key references Employees
                    on delete cascade,
    hourly_rate     integer
);

create table Instructors (
    eid     integer primary key references Employees
            on delete cascade
);

create table Full_time_instructors (
    eid     integer primary key references Instructors
            references Full_time_Emp
            on delete cascade
);

create table Part_time_instructors (
    eid     integer primary key references Instructors
            references Part_time_Emp
            on delete cascade
);

/*
Constraints not satisfied
- a full time employee can either be a full_time_instructor OR Administrator OR Manager
*/
create table Managers (
    manager_id integer primary key references Full_time_Emp on delete cascade,
);

create table Administrators (
    admin_id integer primary key references Full_time_Emp on delete cascade, 
);

create table Course_areas (
    [name]         text primary key,
    manager_id     integer not null references Managers
);

/*
Constraints not satisfied
- Total participation constraint of Instructors with respect to Specializes
*/
create table Specializes (
    instructor_id  integer references Instructors,
    course_area    text references Course_areas,
    primary key(instructor_id, course_area)
);

create table Courses (
    course_id      integer primary key,
    title          text not null unique,
    [description]  text,
    course_area    text not null references Course_areas,
    duration       integer
);

/*
Constraints not satisfied
- start_date and end_date
- deadline must be at least 10 days before its start date
- seating capacity must be the sum of that of its sessions
*/
create table Offerings (
    course_id                     integer references(Courses),
    launch_date                   date,
    fees                          numeric,
    target_number_registrations   integer,
    registration_deadline         date,
    [start_date]                  date,
    end_date                      date, 
    admin_id                      integer not null references Administrators,
    seating_capacity              integer,
    primary key (course_id, launch_date),
);
