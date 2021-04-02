--Employee is either Manager, Administrator or Instructor

--Adminstrator
CREATE OR REPLACE FUNCTION admin_cant_be_mngr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Managers
    WHERE NEW.eid = Managers.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Manager';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS admin_cant_be_mngr ON Administrators;
CREATE TRIGGER admin_cant_be_mngr
BEFORE INSERT OR UPDATE ON Administrators FOR EACH ROW
EXECUTE FUNCTION admin_cant_be_mngr();

CREATE OR REPLACE FUNCTION admin_cant_be_instr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Instructors
    WHERE NEW.eid = Instructors.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already an Instructor';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS admin_cant_be_instr ON Administrators;
CREATE TRIGGER admin_cant_be_instr
BEFORE INSERT OR UPDATE ON Administrators FOR EACH ROW
EXECUTE FUNCTION admin_cant_be_instr();

--Instructor
CREATE OR REPLACE FUNCTION instr_cant_be_mngr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Managers
    WHERE NEW.eid = Managers.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Manager';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS instr_cant_be_mngr ON Instructors;
CREATE TRIGGER instr_cant_be_mngr
BEFORE INSERT OR UPDATE ON Instructors FOR EACH ROW
EXECUTE FUNCTION instr_cant_be_mngr();

CREATE OR REPLACE FUNCTION instr_cant_be_admin()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Administrators
    WHERE NEW.eid = Administrators.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already an Administrator';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS instr_cant_be_admin ON Instructors;
CREATE TRIGGER instr_cant_be_admin
BEFORE INSERT OR UPDATE ON Instructors FOR EACH ROW
EXECUTE FUNCTION instr_cant_be_admin();

--Manager
CREATE OR REPLACE FUNCTION mngr_cant_be_admin()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Administrators
    WHERE NEW.eid = Administrators.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already an Adminstrator';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS mngr_cant_be_admin ON Managers;
CREATE TRIGGER mngr_cant_be_admin
BEFORE INSERT OR UPDATE ON Managers FOR EACH ROW
EXECUTE FUNCTION mngr_cant_be_admin();

CREATE OR REPLACE FUNCTION mngr_cant_be_instr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Instructors
    WHERE NEW.eid = Instructors.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already an Instructor';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS mngr_cant_be_instr ON Managers;
CREATE TRIGGER mngr_cant_be_instr
BEFORE INSERT OR UPDATE ON Managers FOR EACH ROW
EXECUTE FUNCTION mngr_cant_be_instr();

--Employee is either Full-time Emp or Part-time Emp
CREATE OR REPLACE FUNCTION PT_emp_cant_be_FT_emp()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Full_time_Emp
    WHERE NEW.eid = Full_time_Emp.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Full-time Employer';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS PT_emp_cant_be_FT_emp ON Part_time_Emp;
CREATE TRIGGER PT_emp_cant_be_FT_emp
BEFORE INSERT OR UPDATE ON Part_time_Emp FOR EACH ROW
EXECUTE FUNCTION PT_emp_cant_be_FT_emp();

CREATE OR REPLACE FUNCTION FT_emp_cant_be_PT_emp()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Part_time_Emp
    WHERE NEW.eid = Part_time_Emp.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Part-time Employer';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS FT_emp_cant_be_PT_emp ON Full_time_Emp;
CREATE TRIGGER FT_emp_cant_be_PT_emp
BEFORE INSERT OR UPDATE ON Full_time_Emp FOR EACH ROW
EXECUTE FUNCTION FT_emp_cant_be_PT_emp();


--Instructor is either Full-time instructor or Part-time instructor
CREATE OR REPLACE FUNCTION PT_instr_cant_be_FT_instr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Full_time_instructors
    WHERE NEW.eid = Full_time_instructors.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Full-time Instructor';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS PT_instr_cant_be_FT_instr ON Part_time_instructors;
CREATE TRIGGER PT_instr_cant_be_FT_instr
BEFORE INSERT OR UPDATE ON Part_time_instructors FOR EACH ROW
EXECUTE FUNCTION PT_instr_cant_be_FT_instr();

CREATE OR REPLACE FUNCTION FT_instr_cant_be_PT_instr()
RETURNS TRIGGER AS $$
DECLARE count NUMERIC;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Part_time_instructors
    WHERE NEW.eid = Part_time_instructors.eid;
    IF count > 0 THEN
        RAISE NOTICE 'Employee is already a Part-time Instructor';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS FT_instr_cant_be_PT_instr ON Full_time_instructors;
CREATE TRIGGER FT_instr_cant_be_PT_instr
BEFORE INSERT OR UPDATE ON Full_time_instructors FOR EACH ROW
EXECUTE FUNCTION FT_instr_cant_be_PT_instr();

-- Course Offering's start-date must be at least 10 days after deadline
CREATE OR REPLACE FUNCTION offering_start_after_deadline()
RETURNS TRIGGER AS $$
DECLARE 
    diff INTEGER;
BEGIN
    SELECT NEW.start_date::date - NEW.registration_deadline::date INTO diff;
    IF diff < 10 THEN
        RAISE NOTICE 'Start date of Course Offering must be at least 10 days after the deadline';
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS offering_start_after_deadline ON Offerings;
CREATE TRIGGER offering_start_after_deadline
BEFORE INSERT OR UPDATE ON Offerings FOR EACH ROW
EXECUTE FUNCTION offering_start_after_deadline();

-- Course Offering's seating capacity = sum of all sessions
CREATE OR REPLACE FUNCTION offering_capacing_sum_sessions()
RETURNS TRIGGER AS $$
DECLARE
    total INTEGER;
BEGIN   
    SELECT sum(seating_capacity) INTO total 
    FROM Rooms natural join Conducts 
    WHERE course_id = NEW.course_id and launch_date = NEW.launch_date;
    IF total <> NEW.seating_capacity THEN
        RAISE NOTICE 'The seating capacity of a Course Offering must be the sum of the capacity of all its sessions';
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS offering_capacing_sum_sessions ON Offerings;
CREATE TRIGGER offering_capacing_sum_sessions
BEFORE INSERT OR UPDATE ON Offerings FOR EACH ROW
EXECUTE FUNCTION offering_capacing_sum_sessions();

-- Course Offering's start_date and end_date must correspond to the first and last session
CREATE OR REPLACE FUNCTION offering_start_end_date()
RETURNS TRIGGER AS $$
DECLARE
    earliest DATE;
    latest DATE;
BEGIN   
    SELECT min(date), max(date) into earliest, latest
    FROM Sessions
    WHERE course_id = NEW.course_id and launch_date = NEW.launch_date;
    IF NEW.start_date <> earliest OR NEW.end_date <> latest THEN
        RAISE NOTICE 'The start and end date of Course Offering must correspond to its earliest and latest session';
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS offering_start_end_date ON Offerings;
CREATE TRIGGER offering_start_end_date
BEFORE INSERT OR UPDATE ON Offerings FOR EACH ROW
EXECUTE FUNCTION offering_start_end_date();

-- start of jonathan functionality.
--check an instructor who is assigned to teach a course session must be specialized in that course area
CREATE OR REPLACE FUNCTION teacher_specialized()
RETURNS TRIGGER AS $$
DECLARE
    course_course_area TEXT;
    count INTEGER;
BEGIN
    SELECT course_area INTO course_course_area
    FROM Courses
    WHERE Courses.course_id = NEW.course_id;
    SELECT Count(*) INTO count
    FROM Specializes S
    WHERE NEW.eid = S.eid
    AND S.course_area = course_course_area;
    IF (count = 0) THEN
        RAISE NOTICE 'Instructor is not specialized to conduct the session!';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS teacher_specialized ON Conducts;
CREATE TRIGGER teacher_specialized
BEFORE INSERT OR UPDATE ON Conducts FOR EACH ROW
EXECUTE FUNCTION teacher_specialized();

-- For each course offered by the company, a customer can register for at most one of its sessions.
CREATE OR REPLACE FUNCTION register_one_course_session()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Registers R1, Redeems R2
    WHERE (NEW.course_id = R1.course_id AND NEW.launch_date = R1.launch_date AND NEW.number = R1.number)
    OR (NEW.course_id = R2.course_id AND NEW.launch_date = R2.launch_date AND NEW.number = R2.number);
    IF count > 0 THEN
        RAISE NOTICE 'A customer can register at most one session of each course';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS register_one_course_session ON Registers;
CREATE TRIGGER register_one_course_session
BEFORE INSERT OR UPDATE ON Registers FOR EACH ROW
EXECUTE FUNCTION register_one_course_session();

DROP TRIGGER IF EXISTS register_one_course_session ON Redeems;
CREATE TRIGGER register_one_course_session
BEFORE INSERT OR UPDATE ON Redeems FOR EACH ROW
EXECUTE FUNCTION register_one_course_session();

-- Register sessions before the offering registration deadline
CREATE OR REPLACE FUNCTION register_before_deadline()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Offerings O
    WHERE NEW.course_id = O.course_id
    AND NEW.launch_date = O.launch_date
    AND NEW.date > O.registration_deadline;
    IF count > 0 THEN
        RAISE NOTICE 'Register of session must be before the registration deadline of Offering';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS register_before_deadline ON Registers;
CREATE TRIGGER register_before_deadline
BEFORE INSERT OR UPDATE ON Registers FOR EACH ROW
EXECUTE FUNCTION register_before_deadline();

-- Redeems sessions before the offering registration deadline
CREATE OR REPLACE FUNCTION redeems_before_deadline()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Offerings O
    WHERE NEW.course_id = O.course_id
    AND NEW.launch_date = O.launch_date
    AND NEW.redeems_date > O.registration_deadline;
    IF count > 0 THEN
        RAISE NOTICE 'Redeem of session must be before the registration deadline of Offering';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS redeems_before_deadline ON Redeems;
CREATE TRIGGER redeems_before_deadline
BEFORE INSERT OR UPDATE ON Redeems FOR EACH ROW
EXECUTE FUNCTION redeems_before_deadline();

-- The earliest session can start at 9am and the latest session (for each day) must end by 6pm,
-- and no sessions are conducted between 12pm to 2pm
CREATE OR REPLACE FUNCTION session_timing()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.start_time > NEW.end_time) THEN
        RAISE NOTICE 'End time is earlier than start time';
        RETURN NULL;
    ELSIF (NEW.start_time < '09:00' OR NEW.start_time > '18:00' OR (NEW.start_time >= '12:00' AND NEW.start_time < '14:00')) THEN
        RAISE NOTICE 'start time is out of range';
        RETURN NULL;
    ELSIF (NEW.end_time < '09:00' OR NEW.end_time > '18:00' OR (NEW.end_time > '12:00' AND NEW.end_time <= '14:00')) THEN
        RAISE NOTICE 'end time is out of range';
        RETURN NULL;
    ELSIF (NEW.start_time < '12:00' AND NEW.end_time > '12:00') THEN
        RAISE NOTICE 'session is not allowed to conduct between 12pm to 2pm';
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS session_timing ON Sessions;
CREATE TRIGGER session_timing
BEFORE INSERT OR UPDATE ON Sessions FOR EACH ROW
EXECUTE FUNCTION session_timing();

-- No two sessions for the same course offering can be conducted on the same day and at the same time.
CREATE OR REPLACE FUNCTION same_offering_session_timing()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Sessions S
    WHERE NEW.course_id = S.course_id
    AND NEW.launch_date = S.launch_date
    AND NEW.start_time = S.start_time
    AND NEW.date = S.date;
    IF count > 0 THEN
        RAISE NOTICE 'Two sessions for same course offering cannot be conducted on same day and same time!';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS same_offering_session_timing ON Sessions;
CREATE TRIGGER same_offering_session_timing
BEFORE INSERT OR UPDATE ON Sessions FOR EACH ROW
EXECUTE FUNCTION same_offering_session_timing();

--check cancels is cancelling a legitimate register or redeem
CREATE OR REPLACE FUNCTION cancel_legitimate_check()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Registers R1, Redeems R2, Owns O
    WHERE (NEW.launch_date = R1.launch_date AND NEW.course_id = R1.course_id AND NEW.cust_id = O.cust_id AND R1.number = O.number)
    OR (NEW.launch_date = R2.launch_date AND NEW.course_id = R2.course_id AND NEW.cust_id = O.cust_id AND R2.number = O.number);
    IF COUNT = 0 THEN
        RAISE NOTICE 'Cancel is not cancelling a legitimate register or redeem';
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS cancel_legitimate_check ON Cancels;
CREATE TRIGGER cancel_legitimate_check
BEFORE INSERT OR UPDATE ON Cancels FOR EACH ROW
EXECUTE FUNCTION cancel_legitimate_check();

-- update session start and end time is of course duration.
CREATE OR REPLACE FUNCTION check_session_duration()
RETURNS TRIGGER AS $$
DECLARE
    course_duration INTEGER;
    course_minutes INTERVAL;
BEGIN
    SELECT duration INTO course_duration
    FROM Courses C
    WHERE NEW.course_id = C.course_id;
    course_minutes := course_duration * INTERVAL '1 minute';
    IF (NEW.end_time <> (NEW.start_time + course_minutes)) THEN
        NEW.end_time := NEW.start_time + course_minutes;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_session_duration on Sessions;
CREATE TRIGGER check_session_duration
BEFORE INSERT OR UPDATE ON Sessions FOR EACH ROW
EXECUTE FUNCTION check_session_duration();

-- For a credit card payment, the company’s cancellation policy will refund 90% of the paid fees for a registered course if the cancellation
-- is made at least 7 days before the day of the registered session; otherwise, there will no refund for a late cancellation.
-- For a redeemed course session, the company’s cancellation policy will credit an extra course session to the customer’s course package
-- if the cancellation is made at least 7 days before the day of the registered session; otherwise, there will no refund for a late cancellation.
CREATE OR REPLACE FUNCTION update_refund_policy()
RETURNS TRIGGER AS $$
DECLARE
    count1 INTEGER;
    count2 INTEGER;
    register_fee NUMERIC;
    session_date DATE;
BEGIN
    SELECT COUNT(*) INTO count1
    FROM Registers R, Owns O
    WHERE (R.launch_date = NEW.launch_date AND R.course_id = NEW.course_id AND R.sid = NEW.sid)
    AND (O.cust_id = NEW.cust_id AND R.number = O.number);
    SELECT COUNT(*) INTO count2
    FROM Redeems R, Buys B, Owns O
    WHERE (R.launch_date = NEW.launch_date AND R.course_id = NEW.course_id AND R.sid = NEW.sid)
    AND (O.cust_id = NEW.cust_id AND R.number = B.number AND B.number = O.number);
    SELECT date INTO session_date
    FROM Sessions S
    WHERE S.course_id = NEW.course_id AND S.launch_date = NEW.launch_date AND S.sid = NEW.sid;
    SELECT fees INTO register_fee
    FROM Offerings O
    WHERE NEW.course_id = O.course_id AND NEW.launch_date = O.launch_date;
    IF (count1 + count2 = 0) THEN
        RAISE NOTICE 'Cancel is invalid!';
        RETURN NULL;
    ELSIF (count1 > 0) THEN --Register
        IF (NEW.date + 7 <= session_date) THEN
            NEW.refund_amt := register_fee;
        ELSE
            NEW.refund_amt := 0;
        END IF;
        NEW.package_credit := false;
    ELSIF (count2 > 0) THEN --Redeems
        IF (NEW.date + 7 <= session_date) THEN
            NEW.package_credit := true;
        ELSE
            NEW.package_credit := false;
        END IF;
        NEW.refund_amt := 0;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_refund_policy ON Cancels;
CREATE TRIGGER update_refund_policy
BEFORE INSERT OR UPDATE ON Cancels FOR EACH ROW
EXECUTE FUNCTION update_refund_policy();

/* ---------------------- functionalities ----------------------*/
DROP FUNCTION IF EXISTS get_available_course_sessions();
-- 7 get_available_instructors
--This routine is used to retrieve the availability information of instructors who could be assigned to teach a specified course.
--The inputs to the routine include the following: course identifier, start date, and end date. The routine returns a table of
--records consisting of the following information: employee identifier, name, total number of teaching hours that the instructor
--has been assigned for this month, day (which is within the input date range [start date, end date]), and an array of
--the available hours for the instructor on the specified day. The output is sorted in ascending order of employee identifier and day,
--and the array entries are sorted in ascending order of hour.
--CREATE OR REPLACE FUNCTION
--get_available_instructors(course_id INT, start_date DATE, end_date DATE)
--RETURNS VOID AS $$
----RETURNS TABLE(employee_id INT, name TEXT, working_hours INTEGER, day DATE, available_hours INTEGER[]) AS $$
--DECLARE
--    count INTEGER;
--    avail_hours INTEGER[];
--    i INTEGER;
--BEGIN
--    --check start date is not greater than end date
--    IF (start_date > end_date) THEN
--        RAISE EXCEPTION 'start date is earlier than end date!';
--    END IF;
--    --check if course_id inputted is valid.
--    SELECT count(*) INTO count
--    FROM Courses C
--    WHERE C.course_id = course_id;
--    IF count = 0 THEN
--        RAISE EXCEPTION 'Invalid course_id inputted in this function';
--    END IF;
--    -- find eid (instructors that specializes in teaching course teach course)
--    CREATE OR REPLACE VIEW R71 AS
--    SELECT S.eid
--    FROM Specializes S, Courses C,
--    WHERE S.course_area = C.course_area
--    AND C.course_id = course_id;
--    -- find eid with name (employees) and total teaching hours this month (Pay slips)
--    CREATE OR REPLACE VIEW R72 AS
--    SELECT R.eid, E.name, P.num_work_hours
--    FROM R71 R, Employees E, Pay_Slips P
--    WHERE R.eid = E.eid AND E.eid = P.eid;
--
--    --loop for each employee
--
--        -- loop for start date to end date
--        FOR i IN 0..CAST(((end_date - start_date) + 1) AS INTEGER) LOOP
--        END LOOP;
--
--    -- array of available hours.
--END;
--$$ LANGUAGE plpgsql;

-- 8 find_rooms
CREATE OR REPLACE FUNCTION
find_rooms(session_date DATE, start_hour TIME, session_duration INTEGER)
RETURNS TABLE(rid INT) AS $$
DECLARE
    end_hour TIME;
BEGIN
    end_hour := start_hour + session_duration * interval '1 minute';
    IF (start_hour <= '12:00' AND end_hour > '12:00') THEN
        RAISE EXCEPTION 'No session can be conducted between 12pm and 2pm!';
    ELSIF (start_hour < '09:00') THEN
        RAISE EXCEPTION 'No session can start before 9AM!';
    ELSIF (end_hour > '18:00') THEN
        RAISE EXCEPTION 'No session can be conducted after 6PM!';
    END IF;

    --insert variables into table to use it
    DROP TABLE IF EXISTS TABLE8;
    CREATE TABLE TABLE8( start_hour TIME, end_hour TIME, session_date DATE);
    INSERT INTO TABLE8(start_hour, end_hour, session_date) VALUES(start_hour,end_hour, session_date);

    RETURN QUERY
    SELECT R.rid
    FROM Rooms R
    EXCEPT
    SELECT C.rid
    FROM Conducts C, Sessions S, TABLE8 T
    WHERE (C.course_id = S.course_id AND C.launch_date = S.launch_date AND C.sid = S.sid)
    AND T.session_date = S.date
    AND ((S.start_time >= T.start_hour AND T.end_hour > S.start_time)
    OR (T.start_hour >= S.start_time AND S.end_time > T.start_hour));
END;
$$ LANGUAGE plpgsql;

-- 13 buy_course_package
CREATE OR REPLACE FUNCTION
buy_course_package(customer_id INT, course_package_id INT)
RETURNS VOID AS $$
DECLARE
    cust_count INTEGER;
    package_count INTEGER;
    cc_number TEXT;
    date_range INT;
    start_date DATE;
    end_date DATE;
BEGIN
    SELECT Count(*) INTO cust_count
    FROM Customers C
    WHERE C.cust_id = customer_id;
    SELECT Count(*) INTO package_count
    FROM Course_packages C
    WHERE C.package_id = course_package_id;
    IF (cust_count = 0) THEN
        RAISE EXCEPTION 'Invalid customer id!';
    ELSIF (package_count = 0) THEN
        RAISE EXCEPTION 'Invalid course package id!';
    END IF;
    SELECT number INTO cc_number FROM Owns WHERE Owns.cust_id = customer_id LIMIT 1;
    SELECT sale_start_date INTO start_date FROM Course_packages C WHERE C.package_id = course_package_id;
    SELECT sale_end_date INTO end_date FROM Course_packages C WHERE C.package_id = course_package_id;
    date_range := end_date - start_date;
    -- buy package by inserting a record into Buys with a random date between
    -- sale starting date and sale ending date of package
    INSERT INTO Buys (date, num_remaining_redemptions, package_id, number) VALUES
    (start_date + random_between(1, date_range), 1, course_package_id, cc_number);
END;
$$ LANGUAGE plpgsql;

-- 14 get_my_course_package
--This routine is used when a customer requests to view his/her active/partially active course package.
--The input to the routine is a customer identifier. The routine returns the following information as a JSON value:
--package name, purchase date, price of package, number of free sessions included in the package, number of sessions that have not been redeemed,
--and information for each redeemed session (course name, session date, session start hour). The redeemed session information is
--sorted in ascending order of session date and start hour.
CREATE OR REPLACE FUNCTION
get_my_course_package(customer_id INTEGER)
RETURNS SETOF JSON AS $$
DECLARE
    count INTEGER;
BEGIN
    --check if input is valid customer_id
    SELECT count(*) INTO count
    FROM Customers C
    WHERE C.cust_id = customer_id;
    IF count = 0 THEN
        RAISE EXCEPTION 'Input customer_id is invalid!';
    END IF;

    -- get customer id into a table to use it
    DROP TABLE IF EXISTS TABLE14 CASCADE;
    CREATE TABLE TABLE14( cust_id INTEGER);
    INSERT INTO TABLE14(cust_id) VALUES(customer_id);
    --get the active/partially active course package
    CREATE OR REPLACE VIEW R141 AS
    SELECT C.name, B.date, C.num_free_registrations, B.num_remaining_redemptions, B.number, B.package_id
    FROM Buys B, Owns O, Course_packages C, TABLE14 T
    WHERE B.number = O.number
    AND O.cust_id = T.cust_id
    AND C.package_id = B.package_id LIMIT 1;

    --get information for each redeemed session
    CREATE OR REPLACE VIEW R142 AS
    SELECT C.title, S.date, S.start_time
    FROM Redeems R, R141 RR, Courses C, Sessions S
    WHERE (R.number = RR.number AND RR.date = R.date AND R.package_id = RR.package_id)
    AND (R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid)
    AND C.course_id = S.course_id
    ORDER BY S.date ASC, start_time ASC;

    RETURN QUERY
    SELECT row_to_json(
        ROW(R1.name, R1.date, R1.num_free_registrations, R1.num_remaining_redemptions, ROW(R2.*))
    ) FROM R141 R1, R142 R2;

END;
$$ LANGUAGE plpgsql;

-- 15 get_available_course_offerings (remaining seat not updated)
CREATE OR REPLACE FUNCTION
get_available_course_offerings()
RETURNS TABLE(course_title TEXT, course_area TEXT, start_date DATE, end_date DATE, registration_deadline DATE, course_fees NUMERIC, remaining_seat INTEGER) AS $$
BEGIN
    --get count of course offerings for redeems
    CREATE OR REPLACE VIEW R151 AS
    SELECT R.course_id, R.launch_date, count(*) AS redeem_count
    FROM Redeems R
    GROUP BY R.course_id, R.launch_date;
    --get count of course offerings for registers
    CREATE OR REPLACE VIEW R152 AS
    SELECT R.course_id, R.launch_date, count(*) AS register_count
    FROM Registers R
    GROUP BY R.course_id, R.launch_date;
    --get seating capacity of course offerings
    CREATE OR REPLACE VIEW R153 AS
    SELECT O.course_id, O.launch_date, O.seating_capacity
    FROM Offerings O;
    --natural full outer join R1, R2, R3
    CREATE OR REPLACE VIEW R154 AS SELECT * FROM (R151 natural full outer join R152) AS R1512 natural full outer join R153;
    CREATE OR REPLACE VIEW R155 AS
    SELECT course_id, launch_date, (seating_capacity - COALESCE(redeem_count, 0) - COALESCE(register_count, 0)) AS remaining_seat
    FROM R164;

    --return table query.
    RETURN QUERY
    SELECT C.title, C.course_area, O.start_date, O.end_date, O.registration_deadline, O.fees, CAST(R.remaining_seat AS INTEGER)
    FROM Courses C, Offerings O, R155 R
    WHERE (O.course_id = R.course_id AND O.launch_date = R.launch_date)
    AND C.course_id = O.course_id
    AND R.remaining_seat > 0
    ORDER BY O.registration_deadline ASC, C.title ASC;
END;
$$ LANGUAGE plpgsql;

-- 16 get_available_course_sessions
CREATE OR REPLACE FUNCTION
get_available_course_sessions()
RETURNS TABLE(session_date DATE, session_start_hour TIME, instructor_name TEXT, remaining_seat INTEGER) AS $$
BEGIN
    --get count of each course session for redeems
    CREATE OR REPLACE VIEW R161 AS
    SELECT R.course_id, R.launch_date, R.sid, count(*) AS redeem_count
    FROM Redeems R, Sessions S
    WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid
    GROUP BY R.course_id, R.launch_date, R.sid;
    --get count of each course session for registers
    CREATE OR REPLACE VIEW R162 AS
    SELECT R.course_id, R.launch_date, R.sid, count(*) AS register_count
    FROM Registers R, Sessions S
    WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid
    GROUP BY R.course_id, R.launch_date, R.sid;
    --get seating capacity
    CREATE OR REPLACE VIEW R163 AS
    SELECT C.course_id, C.launch_date, C.sid, R.seating_capacity
    FROM Conducts C, Rooms R
    WHERE R.rid = C.rid;
    --natural full outer join R1, R2, R3
    CREATE OR REPLACE VIEW R164 AS SELECT * FROM (R161 natural full outer join R162) AS R1612 natural full outer join R163;
    CREATE OR REPLACE VIEW R165 AS
    SELECT course_id, launch_date, sid, (seating_capacity - COALESCE(redeem_count, 0) - COALESCE(register_count, 0)) AS remaining_seat
    FROM R164;

    --return table statement.
    RETURN QUERY
    SELECT S.date, S.start_time, E.name, CAST(R.remaining_seat AS INTEGER)
    FROM Sessions S, R165 R, Conducts C, Employees E
    WHERE (S.launch_date = R.launch_date AND S.course_id = R.course_id AND S.sid = R.sid)
    AND (S.launch_date = C.launch_date AND S.course_id = C.course_id AND S.sid = C.sid)
    AND C.eid = E.eid
    AND R.remaining_seat > 0
    ORDER BY S.date ASC, S.start_time ASC;
END;
$$ LANGUAGE plpgsql;

-- 26 promote courses
-- This routine is used to identify potential course offerings that could be of interest to inactive customers.
-- A customer is classified as an active customer if the customer has registered for some course offering in the last six months
-- (inclusive of the current month); otherwise, the customer is considered to be inactive customer. A course area A
-- is of interest to a customer C if there is some course offering in area A among the three most recent course offerings registered by C.
-- If a customer has not yet registered for any course offering, we assume that every course area is of interest to that customer.
-- The routine returns a table of records consisting of the following information for each inactive customer:
-- customer identifier, customer name, course area A that is of interest to the customer,
-- course identifier of a course C in area A, course title of C, launch date of course offering of course C that still accepts registrations,
-- course offering’s registration deadline, and fees for the course offering.
-- The output is sorted in ascending order of customer identifier and course offering’s registration deadline.
CREATE OR REPLACE FUNCTION
promote_courses()
RETURNS TABLE(cust_id INT, cust_name TEXT, course_area TEXT, course_id INT, title TEXT, launch_date DATE, registration_deadline DATE, fees NUMERIC) AS $$
DECLARE
    cur1 REFCURSOR;
    cut_off_inactive_date DATE;
    current_day DATE;
    r RECORD;
    customer_id INT;
    count INTEGER;
BEGIN
    current_day := CURRENT_DATE;
    cut_off_inactive_date := make_date(CAST(EXTRACT(YEAR FROM current_day) AS INT), CAST(EXTRACT(MONTH FROM current_day) AS INT), 1);
    cut_off_inactive_date := cut_off_inactive_date - interval '5 month';

    --get course areas with information.
    CREATE OR REPLACE VIEW R260 AS
    SELECT C.course_area, C.course_id, C.title, O.launch_date, O.registration_deadline, O.fees
    FROM Courses C, Offerings O
    WHERE C.course_id = O.course_id
    AND O.registration_deadline >= CURRENT_DATE;
    --create table for cut_off_date
    DROP TABLE IF EXISTS cut_off_date CASCADE;
    CREATE TABLE cut_off_date(date DATE);
    INSERT INTO cut_off_date(date) VALUES(cut_off_inactive_date);
    CREATE OR REPLACE VIEW R261 AS
    --get active customers for redeems
    SELECT O.cust_id
    FROM Redeems R, Owns O, cut_off_date C
    WHERE R.date >= C.date
    AND R.number = O.number;
    --get active customers for registers
    CREATE OR REPLACE VIEW R262 AS
    SELECT O.cust_id
    FROM Registers R, Owns O, cut_off_date C
    WHERE R.date >= C.date
    AND R.number = O.number;
    --get inactive customers
    CREATE OR REPLACE VIEW R263 AS
    SELECT cust_id FROM customers EXCEPT SELECT cust_id FROM (SELECT * FROM R261 UNION SELECT * FROM R262) AS U12;
    --create table for cust_id, cust_name, course_area
    DROP TABLE IF EXISTS TABLE26;
    CREATE TABLE TABLE26 (
        cust_id INTEGER,
        name TEXT,
        course_area TEXT
    );

    --for each inactive customer, get the cust_id, name and course_area customer is interested into TABLE26
    OPEN cur1 FOR SELECT * FROM R263;
    LOOP
        FETCH cur1 INTO r;
        EXIT WHEN NOT FOUND;
        customer_id := r.cust_id;
        DROP TABLE IF EXISTS CI CASCADE;
        CREATE TABLE CI(cust_id int);
        INSERT INTO CI(cust_id) VALUES(customer_id);
        --get redeems for specific inactive customer
        CREATE OR REPLACE VIEW redeems_date AS
        SELECT O.cust_id, R.date, C.course_area
        FROM Owns O, Redeems R, Courses C, CI
        WHERE O.cust_id = CI.cust_id AND R.number = O.number AND C.course_id = R.course_id;
        --get registers for specific inactive customer
        CREATE OR REPLACE VIEW registers_date AS
        SELECT O.cust_id, R.date, C.course_area
        FROM Owns O, Registers R, Courses C, CI
        WHERE O.cust_id = CI.cust_id AND R.number = O.number AND C.course_id = R.course_id;
        --union all for redeems and registers
        CREATE OR REPLACE VIEW RR AS
        SELECT * FROM redeems_date UNION ALL SELECT * FROM registers_date;
        --limit to 3 most course offering registered
        CREATE OR REPLACE VIEW RR_LIMIT AS
        SELECT * FROM RR ORDER BY date DESC LIMIT 3;
        SELECT count(*) INTO count FROM RR_LIMIT;
        IF (count = 0) THEN
            CREATE OR REPLACE VIEW RR_MAX AS
            SELECT CI.cust_id, C1.name, C2.course_area
            FROM CI, Customers C1, Courses C2
            WHERE CI.cust_id = C1.cust_id;
            INSERT INTO TABLE26 (SELECT * FROM RR_MAX);
        ELSE
            INSERT INTO TABLE26 (SELECT RR.cust_id, C.name, RR.course_area FROM Customers C, RR_LIMIT RR WHERE C.cust_id = RR.cust_id);
        END IF;
    END LOOP;
    CLOSE cur1;

    --return table query
    RETURN QUERY
    SELECT T.cust_id, T.name, T.course_area, R260.course_id, R260.title, R260.launch_date, R260.registration_deadline, R260.fees
    FROM R260, (SELECT DISTINCT * FROM TABLE26) AS T
    WHERE T.course_area = R260.course_area;

END;
$$ LANGUAGE plpgsql;

--add_employee
CREATE OR REPLACE FUNCTION 
add_employee(name TEXT, address TEXT, phone TEXT, email TEXT, full_part TEXT, emp_cat TEXT, salary INTEGER, join_date DATE,  course_area TEXT[])
RETURNS VOID AS $$
DECLARE 
    eid INTEGER;
    c_area TEXT;
BEGIN
    SELECT COUNT(*) FROM Employees INTO eid;
    eid := eid + 1;
    --Administrator
    IF emp_cat = 'administrator' THEN
        IF full_part = 'full' THEN
            IF course_area IS NOT NULL THEN
                RAISE EXCEPTION 'Administrator should not have course areas';
            ELSE 
                INSERT INTO Employees(eid, name, address, email, phone, join_date, depart_date) values (eid, name, address, email, phone, join_date, null);
                INSERT INTO Full_time_Emp (eid, monthly_salary) values (eid, salary);
                INSERT INTO Administrators(eid) values (eid);
            END IF;
        ELSE
            RAISE EXCEPTION 'Administrator should be a full-time employee';
        END IF;
    --Manager
    ELSIF emp_cat = 'manager' THEN
        IF full_part = 'full' THEN
            IF course_area IS NULL THEN
                RAISE EXCEPTION 'Manager should manage some course area';
            ELSE
                INSERT INTO Employees (eid, name, address, email, phone, join_date, depart_date) values (eid, name, address, email, phone, join_date, null);
                INSERT INTO Full_time_Emp (eid, monthly_salary) values (eid, salary);
                INSERT INTO Managers (eid) values (eid);
                
                --Insert set of course area into Course_areas
                FOREACH c_area in array course_area LOOP
                    INSERT INTO Course_areas(name, eid) values (c_area, eid);
                END LOOP;
                
            END IF;
        ELSE
            RAISE EXCEPTION 'Manager should be a full-time employee';
        END IF;
    --Instructor
    ELSIF emp_cat = 'instructor' THEN
        IF course_area IS NULL THEN
            RAISE EXCEPTION 'Instructor should have specialization areas';
        ELSE
            IF full_part = 'full' OR full_part = 'part' THEN
                INSERT INTO Employees (eid, name, address, email, phone, join_date, depart_date) values (eid, name, address, email, phone, join_date, null);
                INSERT INTO Instructors (eid) values (eid);
                
                IF full_part = 'full' THEN
                    INSERT INTO Full_time_Emp (eid, monthly_salary) values (eid, salary);
                    INSERT INTO Full_time_instructors (eid) values (eid);
                ELSE
                    INSERT INTO Part_time_Emp (eid, hourly_rate) values (eid, salary);
                    INSERT INTO Part_time_instructors (eid) values (eid);
                END IF;
                
                --Insert set of course area into Specializes
                FOREACH c_area in array course_area LOOP
                    INSERT INTO Specializes (eid, course_area) values (eid, c_area);
                END LOOP;
            ELSE
                RAISE EXCEPTION 'Instructor should be full-time or part-time';    
            END IF;
        END IF;
    ELSE 
        RAISE EXCEPTION 'Employee should be either manager, administrator or instructor';
    END IF;
    
END;
$$ LANGUAGE plpgsql;

--remove employee
CREATE OR REPLACE FUNCTION remove_employee(id INTEGER, d_date DATE)
RETURNS VOID AS $$
DECLARE
    admin_count INTEGER;
    instr_count INTEGER;
    mngr_count INTEGER;
    cnt INTEGER;
    
    off_curs CURSOR FOR (SELECT * FROM Offerings WHERE Offerings.eid = id);
    cnd_curs CURSOR FOR (SELECT * FROM Conducts WHERE Conducts.eid = id);
    r RECORD;
    
BEGIN
    SELECT COUNT(*) FROM Administrators WHERE Administrators.eid = id INTO admin_count;
    SELECT COUNT(*) FROM Instructors WHERE Instructors.eid = id INTO instr_count;
    SELECT COUNT(*) FROM Managers WHERE Managers.eid = id INTO mngr_count;
    
    --admin
    IF admin_count > 0 THEN
        SELECT COUNT(*) FROM Offerings WHERE Offerings.eid = id INTO cnt;
        IF cnt > 0 THEN
            OPEN off_curs;
            LOOP
                FETCH off_curs INTO r;
                EXIT WHEN NOT FOUND;
                IF r.registration_deadline > d_date THEN
                    RAISE EXCEPTION 'Administrator is still handling some course offering';
                    RETURN; --Is this correct?
                END IF;
                
                UPDATE Employees SET depart_date = d_date WHERE Employees.eid = id;
                
            END LOOP;
            CLOSE off_curs;
        ELSE 
            UPDATE Employees SET depart_date = d_date WHERE Employees.eid = id;
        END IF;
    --instr
    ELSIF instr_count > 0 THEN
        SELECT COUNT(*) FROM Conducts WHERE Conducts.eid = id INTO cnt;
        IF cnt > 0 THEN
            OPEN cnd_curs;
            LOOP 
                FETCH cnd_curs INTO r;
                EXIT WHEN NOT FOUND;
                IF r.launch_date > d_date THEN
                    RAISE EXCEPTION 'Instructor is teaching some course that starts after depart date';
                    RETURN;
                END IF;
            END LOOP;
            CLOSE cnd_curs;

            UPDATE Employees SET depart_date = d_date WHERE Employees.eid = id;
        
        ELSE 
            UPDATE Employees SET depart_date = d_date WHERE Employees.eid = id;
        END IF;    
    --mngr
    ELSIF mngr_count > 0 THEN
        SELECT COUNT(*) FROM Course_areas WHERE Course_areas.eid = id INTO cnt;
        IF cnt > 0 THEN
            RAISE EXCEPTION 'Manager is still managing some area';
        ELSE 
            UPDATE Employees SET depart_date = d_date WHERE Employees.eid = id;
        END IF;
    ELSE
        RAISE EXCEPTION 'eid does not exists';
    END IF;
    
END;
$$ LANGUAGE plpgsql;

--add_customer


--update_credit_card


--add_course
CREATE OR REPLACE FUNCTION
add_course(newTitle TEXT, newDescription TEXT, newArea TEXT, newDuration INTEGER)
RETURNS VOID AS $$
DECLARE
    course_id INTEGER;
    title_exists INTEGER;
    course_area_exists INTEGER;
BEGIN
    SELECT COUNT(*) INTO course_id FROM Courses;
    course_id := course_id + 1;
    SELECT COUNT(*) INTO course_area_exists FROM Course_areas WHERE name = newArea;
    SELECT COUNT(*) INTO title_exists FROM Courses WHERE title = newTitle;
    IF newTitle IS NULL THEN
        RAISE EXCEPTION 'Title of Course cannot be null';
    ELSIF newArea IS NULL THEN
        RAISE EXCEPTION 'Course area cannot be null';
    ELSIF course_area_exists = 0 THEN
        RAISE EXCEPTION 'Course area does not exist';
    ELSIF title_exists = 1 THEN
        RAISE EXCEPTION 'There exists an existing Course with the same title';
    END IF;
    INSERT INTO Courses (course_id, title, description, course_area, duration) values (course_id, newTitle, newDescription, newArea, newDuration);
END;
$$ LANGUAGE plpgsql;

--find_instructors
CREATE OR REPLACE FUNCTION
find_instructors(IN cid INTEGER, IN sessionDate DATE, IN sessionStartHour TIME, OUT eid INTEGER, OUT name TEXT)
RETURNS SETOF RECORD AS $$
    SELECT DISTINCT eid, name
    FROM (Employees natural join Specializes) natural join Courses
    WHERE course_id = cid
    EXCEPT
    SELECT DISTINCT eid, name
    FROM (Employees natural join Conducts) natural join Sessions
    WHERE date = sessionDate AND
    ((start_time >= (sessionStartHour - interval '1 hour') AND start_time < (sessionStartHour + interval '2 hours')) OR
    (end_time > (sessionStartHour - interval '1 hour') AND end_time <= (sessionStartHour + interval '2 hours')));
$$ LANGUAGE sql;