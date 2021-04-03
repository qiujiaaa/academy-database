-- add on to drop table if exist ....  cascade?
drop table if exists Owns, Customers, Course_packages, Credit_cards, Buys, Employees, Pay_slips, Full_time_Emp, Part_time_Emp, Instructors, Full_time_instructors, Part_time_instructors, Administrators, Managers, Course_areas, Specializes, Courses, Offerings, Rooms, Sessions, Redeems, Registers, Cancels, Conducts cascade;

create table Customers (
    phone   text,     
    address text, 
    cust_id integer,
    name    text,
    email   text,
    primary key (cust_id)
);

create table Course_packages (
    price                   integer not null,   
    name                    text not null,
    sale_end_date           date not null,
    num_free_registrations  integer not null,
    package_id              integer,   
    sale_start_date         date not null,
    primary key (package_id),
    check (price >= 0 and num_free_registrations >= 0),
    check (sale_start_date::date <= sale_end_date::date)
);

create table Credit_cards (
    expiry_date date not null,
    number      text,     
    CVV         text not null,
    primary key (number)
);

create table Owns (
    from_date date, 
    number text,
    cust_id integer not null,
    primary key (number),
    foreign key (cust_id) references Customers(cust_id),
    foreign key (number) references Credit_cards(number) on update cascade
);

create table Buys (
    date                        date,
    num_remaining_redemptions   integer not null,
    package_id                  integer,
    number                      text,
    primary key (date, package_id, number),
    foreign key (package_id) references Course_packages(package_id),
    foreign key (number) references Credit_cards(number),
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
    constraint depart_after_join check(join_date <  depart_date)
);

create table Pay_slips (
    eid             integer references Employees
                    on delete cascade,
    payment_date    date,
    amount          integer,
    num_work_hours  integer,
    num_work_days   integer,
    primary key (eid, payment_date),
    constraint hours_exceed check (num_work_hours >= 0 and num_work_hours <= 30),
    constraint days_exceed check (num_work_days >= 0 and num_work_days < 32)
);

create table Full_time_Emp (
    eid             integer primary key references Employees
                    on delete cascade,
    monthly_salary  integer not null
);

create table Part_time_Emp (
    eid             integer primary key references Employees
                    on delete cascade,
    hourly_rate     integer not null
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
    eid integer primary key references Full_time_Emp on delete cascade
);

create table Administrators (
    eid integer primary key references Full_time_Emp on delete cascade 
);

create table Course_areas (
    name           text primary key,
    eid            integer not null references Managers
);

/*
Constraints not satisfied
- Total participation constraint of Instructors with respect to Specializes
*/
create table Specializes (
    eid            integer references Instructors on delete cascade,
    course_area    text references Course_areas,
    primary key(eid, course_area)
);

create table Courses (
    course_id      integer primary key,
    title          text not null unique,
    description    text,
    course_area    text not null references Course_areas,
    duration       integer not null
);

/*
Constraints not satisfied
- deadline must be at least 10 days before its start date
- seating capacity must be the sum of that of its sessions
- start_date and end_date
*/
create table Offerings (
    course_id                     integer references Courses,
    launch_date                   date,
    fees                          numeric not null,
    target_number_registrations   integer not null,
    registration_deadline         date not null,
    start_date                    date not null,
    end_date                      date not null, 
    eid                           integer not null references Administrators,
    seating_capacity              integer not null,
    primary key (course_id, launch_date),
    constraint deadline_before_start check(registration_deadline <  start_date),
    constraint start_before_end check(start_date <=  end_date),
    constraint fees_positive check(fees >= 0),
    constraint seating_capacity_positive check(seating_capacity >= 0),
    constraint target_number_registrations_positive check(target_number_registrations >= 0),
    constraint more_seats_than_target check(seating_capacity >= target_number_registrations)
);

create table Rooms (
    rid                 integer primary key,
    location            text,
    seating_capacity    integer not null
);

/*
Constraints not satisfied:
- The earliest session can start at 9am and the latest session (for each day) must end by 6pm, and no sessions are conducted between 12pm to 2pm (done).
- No two sessions for the same course offering can be conducted on the same day and at the same time. (done).
*/
create table Sessions (
    course_id       integer,
    launch_date     date,
    sid             integer,
    start_time      time not null,
    end_time        time not null,
    date            date not null,
    primary key (course_id, launch_date, sid),
    foreign key (course_id, launch_date) references Offerings (course_id, launch_date)
);

/*
Constraints not satisfied:
- For a credit card payment, the company’s cancellation policy will refund 90% of the paid fees for a registered course if the cancellation
is made at least 7 days before the day of the registered session; otherwise, there will no refund for a late cancellation.
For a redeemed course session, the company’s cancellation policy will credit an extra course session to the customer’s course package
if the cancellation is made at least 7 days before the day of the registered session; otherwise, there will no refund for a late cancellation.
*/
create table Cancels (
    course_id           integer,
    launch_date         date,
    sid                 integer,
    cust_id             integer,
    date                date,
    refund_amt          numeric,
    package_credit      boolean not null,
    primary key (course_id, launch_date, sid, cust_id, date),
    foreign key (cust_id) references Customers (cust_id),
    foreign key (course_id, launch_date, sid) references Sessions (course_id, launch_date, sid)
);

create table Registers (
    course_id       integer,
    launch_date     date,
    sid             integer,
    number          text,
    date            date,
    primary key (course_id, launch_date, sid, number, date),
    foreign key (number) references Owns (number),
    foreign key (course_id, launch_date, sid) references Sessions (course_id, launch_date, sid)
);

create table Redeems (
    course_id       integer,
    launch_date     date,
    sid             integer,
    date            date,
    package_id      integer,
    number          text,
    redeems_date    date,
    foreign key (course_id, launch_date, sid) references Sessions (course_id, launch_date, sid),
    foreign key (date, package_id, number) references Buys (date, package_id, number),
    primary key (course_id, launch_date, sid, date, package_id, number, redeems_date)
);

/*
Constraints not satisfied:
- total participation constraint of Sessions with respect to Conducts not enforced.
- cannot check room is conducted at most one course Session at any time.
- cannot check no two sessions for the same course offering can be conducted on the same day and at the same time. (done)
*/
create table Conducts (
    course_id       integer,
    launch_date     date,
    sid             integer,
    rid             integer not null,
    eid             integer not null,
    primary key (course_id, launch_date, sid),
    foreign key (course_id, launch_date, sid) references Sessions (course_id, launch_date, sid),
    foreign key (rid) references Rooms (rid),
    foreign key (eid) references Instructors (eid)
);


