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

--Total participation constraint for Customers & Owns (before update & delete)
create or replace function owns_customers_func() 
returns trigger as $$
declare
	numOfTuple int;
begin
	select count(*) into numOfTuple from Owns where Owns.cust_id = old.cust_id;
	-- if numOfTuple <= 1 then 
	-- 	--terminate
	-- 	raise notice 'Only has at most 1 record, deleting/updating it violates total participation constraint'; -- is this necessary for update? current issue: if only has 1 record cannot update
	-- 	return null;
	-- else
	-- 	--proceed
	-- 	if (tg_op = 'UPDATE') then
	-- 		return new;
	-- 	elseif (tg_op = 'DELETE') then
	-- 		return old;
	-- 	end if;
	-- end if;
    if (tg_op = 'DELETE') THEN
        if numOfTuple <= 1 THEN
            raise notice 'Only has 1 record cannot delete as it violates total participation constraint';
            return null;
        ELSE
            return old;
        end if;
    elseif (tg_op = 'UPDATE') THEN
        return new;
    end if;
end;
$$ language plpgsql;

drop trigger if exists owns_customers_trigger on Owns;
create trigger owns_customers_trigger
before update or delete on Owns
for each row execute function owns_customers_func();

--Total participation constraint for Customers & Owns (after insert & update)
create or replace function owns_customers_func2()
returns trigger as $$
declare
    numOfTuple int;
begin
    select count(*) into numOfTuple from Owns where Owns.cust_id = new.cust_id;
    if numOfTuple < 1 then
        --TODO: terminate check return type
        raise exception 'Did not insert/update into Owns table, therefore terminated';
    else
        --proceed
        return new;
    end if; 
end;
$$ language plpgsql;

drop trigger if exists owns_customers_trigger2 on Customers;
create constraint trigger owns_customers_trigger2
after insert or update on Customers
deferrable initially deferred
for each row execute function owns_customers_func2();

--Total participation constraint for Credit_cards & Owns (before update & delete)
create or replace function owns_cc_func() 
returns trigger as $$
declare
	numOfTuple int;
begin
	select count(*) into numOfTuple from Owns where Owns.number = old.number;
	-- if numOfTuple <= 1 then 
	-- 	--terminate
	-- 	raise notice 'Only has 1 record, deleting/updating it violates total participation constraint';
	-- 	return null;
	-- else
	-- 	--proceed
	-- 	if (tg_op = 'UPDATE') then
	-- 		return new;
	-- 	elseif (tg_op = 'DELETE') then
	-- 		return old;
	-- 	end if;
	-- end if;
    if (tg_op = 'DELETE') THEN
        if numOfTuple <= 1 THEN
            raise notice 'Only has 1 record cannot delete as it violates total participation constraint';
            return null;
        ELSE
            return old;
        end if;
    elseif (tg_op = 'UPDATE') THEN
        return new;
    end if;
end;
$$ language plpgsql;

drop trigger if exists owns_cc_trigger on Owns;
create trigger owns_cc_trigger
before update or delete on Owns
for each row execute function owns_cc_func();

--Total participation constraint for Credit_cards & Owns (after insert & update)
create or replace function owns_cc_func2()
returns trigger as $$
declare
    numOfTuple int;
begin
    select count(*) into numOfTuple from Owns where Owns.number = new.number;
    if numOfTuple < 1 then
        --TODO: terminate check return type
        raise exception 'Did not insert/update into Owns table, therefore terminated';
    else
        --proceed
        return new;
    end if; 
end;
$$ language plpgsql;

drop trigger if exists owns_cc_trigger2 on Credit_cards;
create constraint trigger owns_cc_trigger2
after insert or update on Credit_cards
deferrable initially deferred
for each row execute function owns_cc_func2();

/* ------------------------------- functionalities -------------------------------*/
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
BEFORE INSERT ON Registers FOR EACH ROW
EXECUTE FUNCTION register_one_course_session();

DROP TRIGGER IF EXISTS register_one_course_session ON Redeems;
CREATE TRIGGER register_one_course_session
BEFORE INSERT ON Redeems FOR EACH ROW
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

--check cancels is cancelling a legitimate register or redeem, delete entry from register/redeem
CREATE OR REPLACE FUNCTION cancel_legitimate_check()
RETURNS TRIGGER AS $$
DECLARE
    count INTEGER;
    temp_1 TEXT;
    temp_2 TEXT;
BEGIN
    SELECT COUNT(*) INTO count
    FROM Registers R1, Redeems R2, Owns O
    WHERE (NEW.launch_date = R1.launch_date AND NEW.course_id = R1.course_id AND NEW.cust_id = O.cust_id AND R1.number = O.number)
    OR (NEW.launch_date = R2.launch_date AND NEW.course_id = R2.course_id AND NEW.cust_id = O.cust_id AND R2.number = O.number);
    IF COUNT = 0 THEN
        RAISE NOTICE 'Cancel is not cancelling a legitimate register or redeem';
        RETURN NULL;
    ELSE 
        -- do deletion
        SELECT number INTO temp_1 
        FROM Registers natural join Owns
        WHERE cust_id = NEW.cust_id AND course_id = NEW.course_id AND launch_date = NEW.launch_date;
        SELECT number INTO temp_2 
        FROM Redeems natural join Owns
        WHERE cust_id = NEW.cust_id AND course_id = NEW.course_id AND launch_date = NEW.launch_date;
        IF temp_1 IS NOT NULL THEN
            DELETE FROM Registers WHERE course_id = NEW.course_id AND launch_date = NEW.launch_date and number = temp_1;
        ELSE 
            DELETE FROM Redeems WHERE course_id = NEW.course_id AND launch_date = NEW.launch_date and number = temp_2;
        RETURN NEW;
        END IF;
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

/*
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
*/

/* ---------------------- functionalities ----------------------*/
--add_employee (1)
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

--remove employee (2)
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
                    RETURN;
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

--add_customer (3)
--add_customer (insert into Credit_cards & Owns as well)
create or replace function add_customer(name text, address text, number text, email text, ccnumber text, ccexpirydate date, cvv text)
returns void as $$
declare
	numCustomers int;
begin
	select count(*) into numCustomers from Customers;
	numCustomers := numCustomers + 1;
	if ccexpirydate is not null and cvv is not null then
        insert into Customers (phone, address, cust_id, name, email) values (number, address, numCustomers, name, email);
		insert into Credit_cards (expiry_date, number, CVV) values (ccexpirydate, ccnumber, cvv);
        insert into Owns (from_date, number, cust_id) values (current_date, ccnumber, numCustomers);
	else
		raise exception 'Credit card expiry date and CVV cannot be null, Customer, Credit Card & Owns not inserted';
	end if;
end;
$$ language plpgsql;


--update_credit_card (4)
--update_credit_card (update Owns as well)
-- TODO: clarify which card to update, for now its the latest from_date
create or replace function update_credit_card(cid int, ccNumber text, ccExpiryDate date, newCVV text)
returns void as $$
declare
    ccNumToBeUpdated text;
    latestDate date;
begin
    select max(from_date) into latestDate from Owns where cust_id = cid;
    select number into ccNumToBeUpdated from Owns where cust_id = cid and from_date = latestDate;
    update Credit_cards set expiry_date = ccExpiryDate, number = ccNumber, CVV = newCVV where number = ccNumToBeUpdated;
    update Owns set from_date = current_date where number = ccNumber and cust_id = cid;
end;
$$ language plpgsql;


--add_course (5)
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

--find_instructors (6)
CREATE OR REPLACE FUNCTION
find_instructors(cid INTEGER, sessionDate DATE, sessionStartHour TIME)
RETURNS TABLE(eid INTEGER, name TEXT) AS $$
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

--get_available_instructors (7)
--This routine is used to retrieve the availability information of instructors who could be assigned to teach a specified course.
--The inputs to the routine include the following: course identifier, start date, and end date. The routine returns a table of
--records consisting of the following information: employee identifier, name, total number of teaching hours that the instructor
--has been assigned for this month, day (which is within the input date range [start date, end date]), and an array of
--the available hours for the instructor on the specified day. The output is sorted in ascending order of employee identifier and day,
--and the array entries are sorted in ascending order of hour.
CREATE OR REPLACE FUNCTION
get_available_instructors(cid INT, start_date DATE, end_date DATE)
RETURNS TABLE(employee_id INT, name TEXT, working_hours INTEGER, day DATE, available_hours TIME[]) AS $$
DECLARE
    curs CURSOR FOR (SELECT * FROM Specializes NATURAL JOIN Courses WHERE course_id = cid ORDER BY eid);
    r RECORD;
    lesson_duration INTEGER;
    c_date DATE;
    c_time TIME;
    hours_this_month INTEGER;
    found BOOLEAN;
    hour_array TIME[];
    temp INTEGER;
BEGIN
    --check start date is not greater than end date
    IF (start_date > end_date) THEN
        RAISE EXCEPTION 'Start date is earlier than end date!';
    END IF;
    --check if course_id is valid.
    SELECT count(*) INTO temp FROM Courses C WHERE C.course_id = cid;
    IF temp = 0 THEN
        RAISE EXCEPTION 'Invalid course_id inputted in this function!';
    END IF;

    SELECT duration INTO lesson_duration FROM Courses WHERE course_id = cid;
    OPEN curs;
    LOOP -- loop through all instructors specialising in this course area
        FETCH curs INTO r;
        EXIT WHEN NOT FOUND;
        IF r.eid IS NULL THEN EXIT; END IF;
        RAISE NOTICE 'eid: %', r.eid;
        c_date := start_date;
        found := FALSE;
        RAISE NOTICE 'YO';
        -- check the number of hours this month first
        SELECT COALESCE(sum(duration), 0) INTO hours_this_month FROM Conducts NATURAL JOIN Courses NATURAL JOIN Sessions 
        WHERE eid = r.eid and DATE_PART('month', date) = DATE_PART('month', c_date);
        SELECT count(*) INTO temp FROM Part_time_instructors WHERE eid = r.eid;
        -- is a part timer and this additional lesson will over run 30 hours
        IF temp = 1 AND hours_this_month + lesson_duration > 30 THEN
            -- go to first day of next month & check if it is before end date
            c_date := c_date + interval '1 month';
            c_date := make_date(DATE_PART('year', c_date), DATE_PART('month', c_date), 1);
        END IF;
        LOOP -- loop through all dates to find a date where there is a time slot
            EXIT WHEN found = TRUE OR c_date > end_date;
            hour_array := ARRAY[]::TIME[];
            c_time := '08:00'::time;
            LOOP -- loop through all hour intervals of the date to find available time slots
                EXIT WHEN c_time + interval '1 hour' * lesson_duration > '18:00'::time;
                SELECT count(*) INTO temp FROM Conducts NATURAL JOIN Sessions
                WHERE eid = r.eid AND date = c_date AND c_time >= start_time - interval '1 hour' AND c_time < end_time + interval '1 hour';
                IF temp = 0 THEN -- this timing has no clashes
                    hour_array := array_append(hour_array, c_time);
                END IF;
                c_time := c_time + interval '1 hour';
            END LOOP;
            IF array_length(hour_array, 1) > 0 THEN -- there are possible timings on this date 
            
                employee_id := r.eid;
                name := (SELECT Employees.name FROM Employees WHERE eid = r.eid);
                working_hours := hours_this_month;
                day := c_date;
                available_hours := hour_array;
                found := TRUE;
                RETURN NEXT;
                
            END IF;
            c_date := c_date + interval '1 day';
        END LOOP;
    END LOOP;
    CLOSE curs;
END;
$$ LANGUAGE plpgsql;

--find_rooms (8)
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

    RETURN QUERY
    SELECT R.rid
    FROM Rooms R
    EXCEPT
    SELECT C.rid
    FROM Conducts C, Sessions S
    WHERE (C.course_id = S.course_id AND C.launch_date = S.launch_date AND C.sid = S.sid)
    AND session_date = S.date
    AND ((S.start_time >= start_hour AND end_hour > S.start_time)
    OR (start_hour >= S.start_time AND S.end_time > start_hour));
END;
$$ LANGUAGE plpgsql;

--get_available_rooms (9)
create or replace function get_available_rooms(startDate date, endDate date) 
returns table(roomId int, roomCapacity int, day date, hours time[]) as $$
declare	
	numSessions int;
	curs cursor for (select * from Rooms order by rid);
	r record;
	f record;
	track time;
	d date;
begin
	if startDate > endDate then
		raise exception 'Start date cannot be later than end date';
	else
		hours := array['09:00', '10:00', '11:00', '14:00', '15:00', '16:00', '17:00'];
		if startDate = endDate then
			select count(*) into numSessions from Sessions where date = startDate;
			if numSessions = 0 then -- all rooms available for all timings
				open curs;
				loop
					fetch curs into r;
					exit when not found;
					roomId := r.rid;
					roomCapacity := r.seating_capacity;
					day := startDate;
					return next;
				end loop;
				close curs;
			else
				open curs;
				loop
					fetch curs into r;
					exit when not found;
					hours := array['09:00', '10:00', '11:00', '14:00', '15:00', '16:00', '17:00'];
					roomId := r.rid;
					roomCapacity := r.seating_capacity;
					day := startDate;
					for f in 
					(with tempTable as (select * from Conducts as C1 where C1.rid = roomId)
					select start_time, end_time from Sessions where course_id in (select course_id from tempTable) and launch_date in (select launch_date from tempTable) and sid in (select sid from tempTable) and date = startDate order by start_time) 
					loop
						track := f.start_time;
						loop
							exit when track = f.end_time;
							hours := array_remove(hours, track);
							track := track + '1 hour'::interval;
						end loop;
					end loop;
					return next;
				end loop;
				close curs;
			end if;
		else 
		-- diff day
		for d in select (generate_series(startDate, endDate, '1 day'::interval))::date loop
			open curs;
				loop
					fetch curs into r;
					exit when not found;
					hours := array['09:00', '10:00', '11:00', '14:00', '15:00', '16:00', '17:00'];
					roomId := r.rid;
					roomCapacity := r.seating_capacity;
					day := d;
					for f in 
					(with tempTable as (select * from Conducts as C1 where C1.rid = roomId)
					select start_time, end_time from Sessions where course_id in (select course_id from tempTable) and launch_date in (select launch_date from tempTable) and sid in (select sid from tempTable) and date = d order by start_time) 
					loop
						track := f.start_time;
						loop
							exit when track = f.end_time;
							hours := array_remove(hours, track);
							track := track + '1 hour'::interval;
						end loop;
					end loop;
					return next;
				end loop;
				close curs;
		end loop;
			
		end if;
	end if;
end;
$$ language plpgsql;

--add_course_offering (10)

--add_course_package (11)
-- if not valid raise exception i.e name = (''/null), numFreeSessions = (negative/null), startDate > endDate, startDate = null, endDate = null, price = (negative/null) 
create or replace function add_course_package(packageName text, numberOfFreeCourseSessions int, startDate date, endDate Date, price int)
returns void as $$
declare
	numPackages int;
begin
	if packageName = '' or null then 
		raise exception 'Package name cannot be null or empty';
	elsif numberOfFreeCourseSessions < 0 or null then
		raise exception 'Number of free course sessions cannot be negative';
	elsif startDate::date > endDate::date or startDate::date = null or endDate::date = null then
		raise exception 'Start date cannot be later than end date';
	elsif price < 0 or null then
		raise exception 'Price cannot be negative';
	else
		select count(*) into numPackages from Course_packages;
		numPackages := numPackages + 1;
		insert into Course_packages (price, name, sale_end_date, num_free_registrations, package_id, sale_start_date) values (price, packageName, startDate, numberOfFreeCourseSessions, numPackages, endDate);
	end if;
end;
$$ language plpgsql;

--get_available_course_package (12)
-- returns the course packages that are available from current date and havent expired yet
create or replace function get_available_course_packages() 
returns table(packageName text, numberOfFreeCourseSessions int, endDate date, price int) as $$	
	select name, num_free_registrations, sale_end_date, price from Course_packages where current_date::date >= sale_start_date::date and current_date <= sale_end_date::date;
$$ language sql;

--buy_course_package (13)
CREATE OR REPLACE FUNCTION
buy_course_package(customer_id INT, course_package_id INT)
RETURNS VOID AS $$
DECLARE
    current_day DATE := CURRENT_DATE;
    cust_count INTEGER;
    package_count INTEGER;
    cc_number TEXT;
    start_date DATE;
    end_date DATE;
    redemptions INTEGER;
BEGIN
    --check if inputs are valid
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
    SELECT num_free_registrations INTO redemptions FROM Course_packages C WHERE C.package_id = course_package_id;

    IF (current_day < start_date) THEN
        RAISE EXCEPTION 'Current day is before the course package sale!';
    ELSIF (current_day > end_date) THEN
        RAISE EXCEPTION 'Current day is after course package sale!';
    END IF;

    -- add buy package transaction
    INSERT INTO Buys (date, num_remaining_redemptions, package_id, number) VALUES
    (current_day, redemptions, course_package_id, cc_number);
    RAISE NOTICE 'purchase of course package successful!';
END;
$$ LANGUAGE plpgsql;

--get_my_course_package (14)
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

    RETURN QUERY
    WITH R141 AS (
        --get the active/partially active course package
        SELECT C.name, B.date, C.num_free_registrations, B.num_remaining_redemptions, B.number, B.package_id
        FROM Buys B, Owns O, Course_packages C
        WHERE B.number = O.number
        AND O.cust_id = customer_id
        AND C.package_id = B.package_id LIMIT 1
    ), R142 AS (
        --get information for each redeemed session
        SELECT C.title, S.date, S.start_time
        FROM Redeems R, R141 RR, Courses C, Sessions S
        WHERE (R.number = RR.number AND RR.date = R.date AND R.package_id = RR.package_id)
        AND (R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid)
        AND C.course_id = S.course_id
        ORDER BY S.date ASC, start_time ASC
    )
    SELECT row_to_json(
        ROW(R1.name, R1.date, R1.num_free_registrations, R1.num_remaining_redemptions, ROW(R2.*))
    ) FROM R141 R1, R142 R2;
END;
$$ LANGUAGE plpgsql;

--get_available_course_offerings (15)
CREATE OR REPLACE FUNCTION
get_available_course_offerings()
RETURNS TABLE(course_title TEXT, course_area TEXT, start_date DATE, end_date DATE, registration_deadline DATE, course_fees NUMERIC, remaining_seat INTEGER) AS $$
BEGIN
    --return table query.
    RETURN QUERY
    WITH R151 AS(
        --get count of course offerings for redeems
        SELECT R.course_id, R.launch_date, count(*) AS redeem_count
        FROM Redeems R
        GROUP BY R.course_id, R.launch_date
    ), R152 AS (
        --get count of course offerings for registers
        SELECT R.course_id, R.launch_date, count(*) AS register_count
        FROM Registers R
        GROUP BY R.course_id, R.launch_date
    ), R153 AS (
        --get seating capacity of course offerings
        SELECT O.course_id, O.launch_date, O.seating_capacity
        FROM Offerings O
    ), R154 AS (
        --natural full outer join R151, R152, R153
        SELECT * FROM (R151 natural full outer join R152) AS R1512 natural full outer join R153
    ), R155 AS (
        SELECT course_id, launch_date, (seating_capacity - COALESCE(redeem_count, 0) - COALESCE(register_count, 0)) AS remaining_seat FROM R154
    )
    SELECT C.title, C.course_area, O.start_date, O.end_date, O.registration_deadline, O.fees, CAST(R.remaining_seat AS INTEGER)
    FROM Courses C, Offerings O, R155 R
    WHERE (O.course_id = R.course_id AND O.launch_date = R.launch_date)
    AND C.course_id = O.course_id
    AND R.remaining_seat > 0
    ORDER BY O.registration_deadline ASC, C.title ASC;
END;
$$ LANGUAGE plpgsql;

--get_available_course_sessions (16)
CREATE OR REPLACE FUNCTION
get_available_course_sessions()
RETURNS TABLE(session_date DATE, session_start_hour TIME, instructor_name TEXT, remaining_seat INTEGER) AS $$
BEGIN
    --return table statement.
    RETURN QUERY
    WITH R161 AS (
        --get count of each course session for redeems
        SELECT R.course_id, R.launch_date, R.sid, count(*) AS redeem_count
        FROM Redeems R, Sessions S
        WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid
        GROUP BY R.course_id, R.launch_date, R.sid
    ), R162 AS (
        --get count of each course session for registers
        SELECT R.course_id, R.launch_date, R.sid, count(*) AS register_count
        FROM Registers R, Sessions S
        WHERE R.course_id = S.course_id AND R.launch_date = S.launch_date AND R.sid = S.sid
        GROUP BY R.course_id, R.launch_date, R.sid
    ), R163 AS (
        --get seating capacity
        SELECT C.course_id, C.launch_date, C.sid, R.seating_capacity
        FROM Conducts C, Rooms R
        WHERE R.rid = C.rid
    ), R164 AS (
        --natural full outer join R161, R162, R163
        SELECT * FROM (R161 natural full outer join R162) AS R1612 natural full outer join R163
    ), R165 AS (
        SELECT course_id, launch_date, sid, (seating_capacity - COALESCE(redeem_count, 0) - COALESCE(register_count, 0)) AS remaining_seat
        FROM R164
    )
    SELECT S.date, S.start_time, E.name, CAST(R.remaining_seat AS INTEGER)
    FROM Sessions S, R165 R, Conducts C, Employees E
    WHERE (S.launch_date = R.launch_date AND S.course_id = R.course_id AND S.sid = R.sid)
    AND (S.launch_date = C.launch_date AND S.course_id = C.course_id AND S.sid = C.sid)
    AND C.eid = E.eid
    AND R.remaining_seat > 0
    ORDER BY S.date ASC, S.start_time ASC;
END;
$$ LANGUAGE plpgsql;

--register_session (17)
CREATE OR REPLACE FUNCTION
register_session(cust INTEGER, cid INTEGER, cdate DATE, session INTEGER, payment TEXT)
RETURNS VOID AS $$
DECLARE
    temp INTEGER;
    today DATE;
    cc TEXT;
    package INTEGER;
    package_date DATE;
BEGIN
    IF cust IS NULL THEN
        RAISE EXCEPTION 'Customer ID cannot be null';
    ELSIF cid IS NULL THEN
        RAISE EXCEPTION 'Course ID cannot be null';
    ELSIF cdate IS NULL THEN
        RAISE EXCEPTION 'Course offering launch date cannot be null';
    ELSIF session IS NULL THEN
        RAISE EXCEPTION 'Session number cannot be null';
    ELSIF payment IS NULL THEN
        RAISE EXCEPTION 'Payment cannot be null';
    END IF;

    IF payment <> 'credit card' AND payment <> 'redemption' THEN
        RAISE EXCEPTION 'Payment method is invalid';
    END IF;

    SELECT count(*) INTO temp FROM Offerings WHERE course_id = cid AND launch_date = cdate;
    IF temp = 0 THEN
        RAISE EXCEPTION 'Course Offering does not exist';
    END IF;
    SELECT count(*) INTO temp FROM Sessions WHERE course_id = cid AND launch_date = cdate AND sid = session;
    IF temp = 0 THEN
        RAISE EXCEPTION 'Session does not exist';
    END IF;

    today := CURRENT_DATE;
    IF payment = 'redemption' THEN
        SELECT package_id, Buys.date, number INTO package, package_date, cc
        FROM Buys natural join Owns
        WHERE cust_id = cust AND num_remaining_redemptions > 0 LIMIT 1;
        IF package IS NULL THEN
            RAISE EXCEPTION 'No active course package associated with customer';
        ELSE
            INSERT INTO REDEEMS (course_id, launch_date, sid, date, package_id, number, redeems_date) VALUES (cid, cdate, session, package_date, package, cc, today);
        END IF;
    ELSE
        SELECT number INTO cc FROM Owns WHERE cust_id = cust ORDER BY from_date DESC LIMIT 1;
        IF cc IS NULL THEN
            RAISE EXCEPTION 'Customer does not own any credit card';
        END IF;
        INSERT INTO Registers (course_id, launch_date, sid, number, date) VALUES (cid, cdate, session, cc, CURRENT_DATE);
    END IF;
END;
$$ LANGUAGE plpgsql;

--get_my_registrations (18)
CREATE OR REPLACE FUNCTION
get_my_registrations(cust INTEGER)
RETURNS TABLE(course_name TEXT, course_fees NUMERIC, session_date DATE, session_start_hour TIME, session_duration DOUBLE PRECISION, instructor_name TEXT) AS $$
    WITH RegisteredSessionDetails as (
        SELECT DISTINCT A.number, A.title, A.fees, B.date, B.start_time, DATE_PART('hour', B.end_time - B.start_time) + DATE_PART('minute', B.end_time - B.start_time)/60.0 as duration, B.name
        FROM (Registers natural join Courses natural join Offerings) A join (Sessions natural join Conducts natural join Employees) B
        ON A.sid = B.sid AND A.course_id = B.course_id AND A.launch_date = B.launch_date
        WHERE B.date > CURRENT_DATE or (B.date = CURRENT_DATE and B.end_time > CURRENT_TIME)
        UNION
        SELECT DISTINCT A.number, A.title, A.fees, B.date, B.start_time, DATE_PART('hour', B.end_time - B.start_time) + DATE_PART('minute', B.end_time - B.start_time)/60.0 as duration, B.name
        FROM (Redeems natural join Courses natural join Offerings) A join (Sessions natural join Conducts natural join Employees) B
        ON A.sid = B.sid AND A.course_id = B.course_id AND A.launch_date = B.launch_date
        WHERE B.date > CURRENT_DATE or (B.date = CURRENT_DATE and B.end_time > CURRENT_TIME))
    SELECT DISTINCT title, fees, date, start_time, duration, name
    FROM RegisteredSessionDetails JOIN Owns on RegisteredSessionDetails.number = Owns.number
    WHERE Owns.cust_id = cust
    ORDER BY date, start_time;
$$ LANGUAGE sql;

--update_course_session (19)
CREATE OR REPLACE FUNCTION
update_course_session(cust INTEGER, cid INTEGER, cdate DATE, new_session INTEGER)
RETURNS VOID AS $$
DECLARE
    temp INTEGER;
    temp_1 TEXT;
    temp_2 TEXT;
BEGIN
    SELECT count(*) INTO temp FROM Offerings WHERE course_id = cid AND launch_date = cdate;
    IF temp = 0 THEN
        RAISE EXCEPTION 'Course Offering does not exist';
    END IF;
    SELECT number INTO temp_1
    FROM Registers natural join Owns
    WHERE cust_id = cust AND course_id = cid AND launch_date = cdate;
    SELECT number INTO temp_2
    FROM Redeems natural join Owns
    WHERE cust_id = cust AND course_id = cid AND launch_date = cdate;
    IF temp_1 IS NULL AND temp_2 IS NULL THEN
        RAISE EXCEPTION 'Customer does not have an existing session for this course offering';
    END IF;
    IF temp_1 IS NOT NULL THEN
        UPDATE Registers SET sid = new_session
        WHERE course_id = cid AND launch_date = cdate AND number = temp_1;
    ELSE
        UPDATE Redeems SET sid = new_session
        WHERE course_id = cid AND launch_date = cdate AND number = temp_2;
    END IF;
END;
$$ LANGUAGE plpgsql;

--cancel_registration (20)
CREATE OR REPLACE FUNCTION
cancel_registration(cust INTEGER, cid INTEGER, cdate DATE)
RETURNS VOID AS $$
DECLARE
    temp INTEGER;
    temp_1 TEXT;
    temp_2 TEXT;
    days INTEGER;
    session_date DATE;
    cc TEXT;
    session INTEGER;
    amt NUMERIC;
    buy_date DATE;
    remaining INTEGER;
    package INTEGER;
BEGIN
    SELECT count(*) INTO temp FROM Offerings WHERE course_id = cid AND launch_date = cdate;
    IF temp = 0 THEN
        RAISE EXCEPTION 'Course Offering does not exist';
    END IF;
    SELECT number INTO temp_1
    FROM Registers natural join Owns
    WHERE cust_id = cust AND course_id = cid AND launch_date = cdate;
    SELECT number INTO temp_2
    FROM Redeems natural join Owns
    WHERE cust_id = cust AND course_id = cid AND launch_date = cdate;
    IF temp_1 IS NULL AND temp_2 IS NULL THEN
        RAISE EXCEPTION 'Customer does not have an existing session for this course offering';
    END IF;

    IF temp_1 IS NOT NULL THEN
        -- Credit card payment in Registers
        SELECT S.date, R.number, R.sid INTO session_date, cc, session
        FROM Sessions S join (Registers natural join Owns) R
        ON S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid
        WHERE S.course_id = cid AND S.launch_date = cdate AND R.cust_id = cust;
        SELECT session_date::date - CURRENT_DATE::date INTO days;
        IF days < 7 THEN
            RAISE EXCEPTION 'Cancellation needs to be made at least 7 days before the day of registered session';
        ELSE
            SELECT fees INTO amt FROM Offerings WHERE course_id = cid AND launch_date = cdate;
            INSERT INTO Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) VALUES (cid, cdate, session, cust, CURRENT_DATE, amt * 0.9, FALSE);
            -- trigger will delete from register
        END IF;
    ELSE
        -- add 1 session into buys
        SELECT R.date, R.number, R.package_id, S.sid, S.date INTO buy_date, cc, package, session, session_date
        FROM Sessions S join (Redeems natural join Owns) R
        ON S.course_id = R.course_id AND S.launch_date = R.launch_date AND S.sid = R.sid
        WHERE S.course_id = cid AND S.launch_date = cdate AND R.cust_id = cust;
        SELECT session_date::date - CURRENT_DATE::date INTO days;
        IF days < 7 THEN
            RAISE EXCEPTION 'Cancellation needs to be made at least 7 days before the day of registered session';
        ELSE
            SELECT num_remaining_redemptions INTO remaining FROM Buys 
            WHERE date = buy_date AND package_id = package AND number = cc;
            UPDATE Buys SET num_remaining_redemptions = remaining + 1
            WHERE date = buy_date AND package_id = package AND number = cc;
            INSERT INTO Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) VALUES (cid, cdate, session, cust, CURRENT_DATE, 0, TRUE);
            -- trigger will delete from redeems
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

--update_instructor (21)
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION
update_instructor(cid INTEGER, l_date DATE, sess_id INTEGER, new_eid INTEGER)
RETURNS VOID AS $$
DECLARE
    instr_count INTEGER;
    conducts_count INTEGER;
    today DATE;
    sess_date DATE;
    area TEXT;
    area_count INTEGER;
BEGIN
    SELECT COUNT(*) FROM Instructors WHERE eid = new_eid INTO instr_count;
    --instructor does not exists
    IF instr_count = 0 THEN
        RAISE EXCEPTION 'Instructor does not exists';
        RETURN;
    ELSE
        SELECT COUNT(*) FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO conducts_count;
        --Session does not exists
        IF conducts_count = 0 THEN
            RAISE EXCEPTION 'This session does not exists';
            RETURN;
        ELSE
            SELECT CURRENT_DATE INTO today;
            SELECT date FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO sess_date;
            --session alr launched
            IF sess_date < today THEN
                RAISE EXCEPTION 'Session has already launched, cannot change instructor';
                RETURN;
            ELSE
                --instructor not specialize in that area
                SELECT course_area FROM Courses WHERE cid = course_id into area;
                SELECT COUNT(*) FROM Specializes WHERE new_eid = eid AND area = course_area INTO area_count;
                IF area_count = 0 THEN
                    RAISE EXCEPTION 'New instructor is not specializes in this course area';
                    RETURN;
                ELSE
                    UPDATE Conducts SET eid = new_eid WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
                END IF;
            END IF;
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;

--update_room (22)
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION update_room(cid INTEGER, l_date DATE, sess_id INTEGER, new_rid INTEGER)
RETURNS VOID AS $$
DECLARE
    room_count INTEGER;
    conducts_count INTEGER;
    today DATE;
    sess_date DATE;
    seat_cap INTEGER;
    no_of_reg INTEGER;
    old_room_cap INTEGER;
    old_rid INTEGER;
    off_seat_cap INTEGER;
    new_cap INTEGER;
BEGIN
    SELECT COUNT(*) FROM Rooms WHERE rid = new_rid into room_count;
    --Room does not exists
    IF room_count = 0 THEN
        RAISE EXCEPTION 'Room does not exists';
        RETURN;
    ELSE
        SELECT COUNT(*) FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO conducts_count;
        --Session does not exists
        IF conducts_count = 0 THEN
            RAISE EXCEPTION 'This session does not exists';
            RETURN;
        ELSE
            SELECT CURRENT_DATE INTO today;
            SELECT date FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO sess_date;
            --Session alr launched
            IF sess_date < today THEN
                RAISE EXCEPTION 'Session has already launched, cannot change room';
                RETURN;
            ELSE
                SELECT seating_capacity FROM Rooms WHERE rid = new_rid INTO seat_cap;
                SELECT COUNT(*) FROM Registers WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO no_of_reg;
                --No of Reg > Seat Cap
                IF no_of_reg > seat_cap THEN
                    RAISE EXCEPTION 'Number of registration for this session exceeds the seating capacity of new room';
                    RETURN;
                ELSE
                    SELECT rid FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO old_rid;
                    SELECT seating_capacity FROM Rooms WHERE rid = old_rid INTO old_room_cap;
                    SELECT seating_capacity FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO off_seat_cap;
                    
                    new_cap := off_seat_cap + (seat_cap - old_room_cap);
                    
                    UPDATE Conducts SET rid = new_rid WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
                    UPDATE Offerings SET seating_capacity = new_cap WHERE course_id = cid AND l_date = launch_date;
                END IF;
            END IF;
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;

--remove_session (23)
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION remove_session(cid INTEGER, l_date DATE, sess_id INTEGER)
RETURNS VOID AS $$
DECLARE
    sess_count INTEGER;
    today DATE;
    sess_date DATE;
    regist_count INTEGER;
    room_id INTEGER;
    room_seat_cap INTEGER;
    seat_cap INTEGER;
    new_cap INTEGER;
BEGIN
    SELECT COUNT(*) FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO sess_count;
    IF sess_count = 0 THEN
        RAISE EXCEPTION 'Session does not exists';
        RETURN;
    ELSE
        SELECT CURRENT_DATE INTO today;
        SELECT date FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO sess_date;
        IF sess_date < today THEN
            RAISE EXCEPTION 'Session has already launched, cannot remove session';
            RETURN;
        ELSE
            SELECT COUNT(*) FROM Registers WHERE course_id = cid AND l_date = launch_date AND sid = sess_id into regist_count;
            IF regist_count > 0 THEN
                RAISE EXCEPTION 'There is at least one registration for the session';
                RETURN;
            ELSE
                SELECT rid FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO room_id;
                SELECT seating_capacity FROM Rooms WHERE rid = room_id INTO room_seat_cap;
                SELECT seating_capacity FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO seat_cap;
                
                DELETE FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
                DELETE FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
                
                new_cap := seat_cap - room_seat_cap;
                UPDATE Offerings SET seating_capacity = new_cap WHERE course_id = cid AND l_date = launch_date;
            END IF;
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;

--add_session (24)
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION
add_session(cid INTEGER, l_date DATE, new_sid INTEGER, new_date DATE, new_start TIME, instr_id INTEGER, room_id INTEGER)
RETURNS VOID AS $$
DECLARE
    today DATE;
    deadline DATE;
    offering_start DATE;
    offering_end DATE;
    offering_reg DATE;
    dur INTEGER;
    sess_count INTEGER;
    area TEXT;
    area_count INTEGER;
    room_seat_cap INTEGER;
    seat_cap INTEGER;
    max_sid INTEGER;
    new_cap INTEGER;
    check_start_date DATE;
BEGIN
    SELECT CURRENT_DATE INTO today;
    SELECT registration_deadline FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO deadline;
    IF deadline < today THEN
        RAISE EXCEPTION 'Course offerings registration deadline passed';
        RETURN;
    ELSE
        SELECT COUNT(*) FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sid = new_sid INTO sess_count;
        SELECT MAX(sid) FROM Sessions WHERE course_id = cid AND l_date = launch_date INTO max_sid;
        
        IF max_sid IS NULL THEN
            max_sid = 0;
        END IF;
        
        --sid already exists
        IF sess_count <> 0 THEN
            RAISE EXCEPTION 'Session number already exists';
            RETURN;
        ELSE
            --sid must be in increasing order
            IF new_sid <> (max_sid+1) THEN
                RAISE EXCEPTION 'New session number is not in increasing order, new sid should be %', max_sid+1;
                RETURN;
            ELSE 
                SELECT start_date FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO offering_start;
                SELECT end_date FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO offering_end;
                SELECT registration_deadline FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO offering_reg;
                
                --Session date is earlier than offering's registration deadline
                IF new_date < offering_reg THEN
                    RAISE EXCEPTION 'Session date is earlier than registration deadline';
                    RETURN;
                ELSE 
                    --check that intructor is specialize in that area
                    SELECT course_area FROM Courses WHERE course_id = cid INTO area;
                    SELECT COUNT(*) FROM Specializes WHERE eid = instr_id AND area = course_area INTO area_count;
                    
                    IF area_count = 0 THEN
                        RAISE EXCEPTION 'Instructor is not specialize in this course_area';
                        RETURN;
                    ELSE 
                        --get duration from Courses table
                        SELECT duration FROM Courses WHERE cid = course_id INTO dur; 
                        
                        INSERT INTO Sessions(course_id, launch_date, sid, start_time, end_time, date) VALUES (cid, l_date, new_sid, new_start, new_start + (dur * interval '1 hour'), new_date);
                        INSERT INTO Conducts(course_id, launch_date, sid, rid, eid) VALUES (cid, l_date, new_sid, room_id, instr_id);
                        
                        --seating capacity
                        SELECT seating_capacity FROM Rooms WHERE rid = room_id INTO room_seat_cap;
                        SELECT seating_capacity FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO seat_cap;
                        new_cap := seat_cap + room_seat_cap;
                        
                        --update if new session date is earlier than offering start date
                        IF offering_start > new_date THEN 
                            UPDATE Offerings SET start_date = new_date, seating_capacity = new_cap WHERE course_id = cid AND l_date = launch_date;
                            SELECT start_date FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO check_start_date;
                            IF check_start_date <> new_date THEN
                                RAISE EXCEPTION 'Start date should be at least 10 days after registration deadline';
                                RETURN;
                            END IF;
                        END IF;
                        
                        --update if new session date is later than offering end date
                        IF offering_end < new_date THEN
                            UPDATE Offerings SET end_date = new_date, seating_capacity = new_cap WHERE course_id = cid AND l_date = launch_date;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;

--pay_salary (25)
create or replace function pay_salary() -- PT (numWorkDays & monthly salary null), FT (numWorkHours & hourly rate null) 
returns table(empId int, empName text, empStatus text, numWorkDays int, numWorkHours int, rate int, monthlySalary int, amountPaid int) as $$
declare
	curs cursor for (select * from Employees order by eid);
	r record;
	joinDate date;
	departDate date;
	firstWorkDay int;
	lastWorkDay int;
	paymentMonth int;
	paymentYear int;
	joinMonth int;
	joinYear int;
	departMonth int;
	departYear int;
	numDaysInMonth int;
begin
	open curs;
    loop
		fetch curs into r;
		exit when not found;
		empId := r.eid;
		empName := r.name;
		if r.eid in (select eid from Full_time_Emp) then -- hourlyrate and workhours null 
			empStatus := 'full-time';
			select join_date into joinDate from Employees where eid = r.eid;
			select extract(month from current_date)::integer into paymentMonth;
			select extract(year from current_date)::integer into paymentYear;
			select extract(month from joinDate)::integer into joinMonth;
			select extract(month from joinDate)::integer into joinYear;
			if joinMonth = paymentMonth and joinYear = paymentYear then -- first day of work = day of joined date
				select extract(day from joinDate)::integer into firstWorkDay;
			else -- first day of work = 1
				firstWorkDay := 1;
			end if;
			SELECT DATE_PART('days', DATE_TRUNC('month', current_date) + '1 MONTH'::INTERVAL - '1 DAY'::INTERVAL)::integer into numDaysInMonth;
			select depart_date into departDate from Employees where eid = r.eid; 
			select extract(month from departDate)::integer into departMonth;
			select extract(year from departDate)::integer into departYear;
			if departMonth = paymentMonth and departYear = paymentYear then
				select extract(day from departDate)::integer into lastWorkDay;
			else
                lastWorkDay := numDaysInMonth;
			end if;
			numWorkDays := lastWorkDay - firstWorkDay + 1;
			numWorkHours := null;
			rate := null;
			select monthly_salary into monthlySalary from Full_time_Emp where eid = r.eid;
			amountPaid := monthlySalary * (numWorkDays / numDaysInMonth);
			insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (empId, current_date, amountPaid, numWorkHours, numWorkDays);
			return next;
		else -- part time instructor, monthly salary and numWorkDays null
			empStatus := 'part-time';
			numWorkDays := null;
			with table1 as (select course_id, launch_date, sid from Conducts where eid = r.eid)
            select extract(hour from sum(end_time - start_time))::integer into numWorkHours from Sessions as S where (S.course_id, S.launch_date, S.sid) in (select * from table1);
			select hourly_rate into rate from Part_time_Emp where eid = r.eid;
			if numWorkHours is null then
				numWorkHours := 0;
				amountPaid := 0;
			else
				amountPaid := rate * numWorkHours;
			end if;
			monthlySalary := null;
			insert into Pay_slips (eid, payment_date, amount, num_work_hours, num_work_days) values (empId, current_date, amountPaid, numWorkHours, null);
			return next;
		end if;
	end loop;
	close curs;
end;
$$ language plpgsql;

--promote_courses (26)
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

--top_packages (27)
CREATE OR REPLACE FUNCTION
top_packages(n INTEGER)
RETURNS TABLE(package_id INTEGER, free_sessions INTEGER, price INTEGER, start_date DATE, end_date DATE, quantity_sold BIGINT) AS $$
    WITH PopularCourses as (
        SELECT DISTINCT package_id, num_free_registrations, price, sale_start_date, sale_end_date, count(*) as quantity
        FROM Course_packages NATURAL JOIN Buys
        WHERE DATE_PART('year', CURRENT_DATE) = DATE_PART('year', sale_start_date)
        GROUP BY package_id
        ORDER BY count(*) DESC),
    TopNCourses as (
        (SELECT * FROM PopularCourses LIMIT n)
        UNION
        SELECT * FROM PopularCourses
        WHERE quantity = (SELECT quantity FROM PopularCourses OFFSET (n-1) LIMIT 1))
    SELECT * FROM TopNCourses ORDER BY quantity DESC, price DESC;
$$ LANGUAGE sql;

--popular_courses (28)
CREATE OR REPLACE FUNCTION
popular_courses()
RETURNS TABLE(course_id INTEGER, course_title TEXT, course_area TEXT, num_offerings BIGINT, registrations BIGINT) AS $$
    -- A = list of courses with at least 2 offerings this year
    WITH A as (
        SELECT course_id, launch_date, start_date, title, course_area
        FROM (Offerings NATURAL JOIN Courses) O1
        WHERE DATE_PART('year', CURRENT_DATE) = DATE_PART('year', start_date) AND
            2 <= (SELECT COUNT(*) FROM Offerings NATURAL JOIN Courses WHERE O1.course_id = course_id)),
    -- B = all registrations
    B as (
        SELECT course_id, launch_date, start_date FROM Registers NATURAL JOIN Offerings
        UNION ALL
        SELECT course_id, launch_date, start_date FROM Redeems NATURAL JOIN Offerings),
    -- C = course offerings and their number of registrations
    C as (
        SELECT course_id, launch_date, start_date, count(*) as registrations
        FROM B GROUP BY course_id, launch_date, start_date),
    -- OfferingRegistrations = courses with at least 2 offerings this year and their registrations for each offering
    OfferingRegistrations as (
        SELECT * FROM A NATURAL JOIN C),
    -- InvalidCourses = course_ids where there exists 2 offerings O1, O2 such that O1 starts earlier than O2 and O1's registrations >= O2's registrations
    InvalidCourses as (
        SELECT DISTINCT O1.course_id
        FROM OfferingRegistrations O1, OfferingRegistrations O2
        WHERE O1.course_id = O2.course_id AND O1.start_date > O2.start_date AND
            O1.registrations <= O2.registrations
    ),
    ValidOfferingRegistrations as (
        SELECT * FROM OfferingRegistrations O WHERE NOT EXISTS (SELECT 1 FROM InvalidCourses I WHERE I.course_id = O.course_id)
    ),
    OfferingCount as (
        SELECT DISTINCT course_id, count(*) as num_offerings FROM ValidOfferingRegistrations GROUP BY course_id
    ),
    LatestOffering as (
        SELECT DISTINCT course_id, registrations FROM ValidOfferingRegistrations O
        WHERE start_date = (SELECT max(start_date) FROM ValidOfferingRegistrations WHERE O.course_id = course_id)
    )
    SELECT course_id, title, course_area, num_offerings, registrations FROM ValidOfferingRegistrations natural join OfferingCount natural join LatestOffering
    ORDER BY registrations DESC, course_id;
$$ LANGUAGE sql;

--view_summary_report (29)
CREATE OR REPLACE FUNCTION view_summary_report(n INTEGER)
RETURNS TABLE(mth INTEGER, yr INTEGER, salary_paid INTEGER, sales_of_cpkg INTEGER, reg_fee_cc INTEGER, refund_fees INTEGER, creg_cpkg INTEGER) AS $$
BEGIN
    IF n <= 0 THEN
        RAISE EXCEPTION 'Please input a number greater than 0';
        RETURN;
    END IF;

    FOR i IN 0..(n-1) LOOP
        mth := DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL);
        yr := DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL);

        --total salary paid
        SELECT SUM(amount)
        FROM Pay_slips
        WHERE DATE_PART('year', payment_date) = DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        AND DATE_PART('month', payment_date) = DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        INTO salary_paid;

        IF salary_paid IS NULL THEN
            salary_paid := 0;
        END IF;

        --total amount of sales of course packages
        SELECT SUM(C.price)
        FROM Buys B, Course_packages C
        WHERE B.package_id = C.package_id
        AND DATE_PART('year', B.date) = DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        AND DATE_PART('month', B.date) = DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        INTO sales_of_cpkg;

        IF sales_of_cpkg IS NULL THEN
            sales_of_cpkg := 0;
        END IF;

        --total registration fees paid via credit card
        SELECT SUM(O.fees)
        FROM Registers R, Offerings O
        WHERE R.course_id = O.course_id
        AND R.launch_date = O.launch_date
        AND DATE_PART('year', R.date) = DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        AND DATE_PART('month', R.date) = DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        INTO reg_fee_cc;

        IF reg_fee_cc IS NULL THEN
            reg_fee_cc := 0;
        END IF;

        --total amount refunded registration fees
        SELECT SUM(refund_amt)
        FROM Cancels
        WHERE DATE_PART('year', date) = DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        AND DATE_PART('month', date) = DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        INTO refund_fees;

        IF refund_fees IS NULL THEN
            refund_fees := 0;
        END IF;

        --total number of course registrationss via course_package redemptions
        SELECT COUNT(*)
        FROM Redeems
        WHERE DATE_PART('year', redeems_date) = DATE_PART('year', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        AND DATE_PART('month', redeems_date) = DATE_PART('month', CURRENT_DATE - CONCAT(i::TEXT, ' month')::INTERVAL)
        INTO creg_cpkg;

        RETURN NEXT;

    END LOOP;

END
$$ LANGUAGE plpgsql;

--view_manager_report (30)
CREATE OR REPLACE FUNCTION view_manager_report()
RETURNS TABLE(mngr_name TEXT, c_area INTEGER, co_ended INTEGER, net_fees NUMERIC, c_title TEXT) AS $$
DECLARE
    curs CURSOR FOR (SELECT * FROM Managers M, Employees E WHERE M.eid = E.eid ORDER BY name);
    r RECORD;

    total_cc NUMERIC;
    total_cp NUMERIC;
    total_refunded NUMERIC;

    refcurs REFCURSOR;
    r_title RECORD;

    title_cc NUMERIC;
    title_cp NUMERIC;
    title_refunded NUMERIC;

    title_max NUMERIC;
    title_temp NUMERIC;
BEGIN
    OPEN curs;
    LOOP
        FETCH curs INTO r;
        EXIT WHEN NOT FOUND;

        --manager name
        mngr_name := r.name;

        --total number of course area managed by manager
        SELECT COUNT(*)
        FROM Course_areas C
        WHERE C.eid = r.eid
        INTO c_area;

        --total number of offerings that ended this year that are managed by manager
        SELECT COUNT(*)
        FROM Course_areas CA, Courses C, Offerings O
        WHERE CA.eid = r.eid
        AND CA.name = C.course_area
        AND C.course_id = O.course_id
        AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
        INTO co_ended;

        --total net registration fees for all course offerings that ended this year
        --paid via credit card
        SELECT SUM(O.fees)
        FROM Course_areas CA, Courses C, Offerings O, Registers Reg
        WHERE CA.eid = r.eid
        AND CA.name = C.course_area
        AND C.course_id = O.course_id
        AND O.course_id = Reg.course_id
        AND O.launch_date = Reg.launch_date
        AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
        INTO total_cc;

        IF total_cc IS NULL THEN
            total_cc := 0;
        END IF;

        --paid via course package
        SELECT SUM(ROUND(CP.price / CP.num_free_registrations))
        FROM Course_areas CA, Courses C, Offerings O, Redeems Re, Course_packages CP
        WHERE CA.eid = r.eid
        AND CA.name = C.course_area
        AND C.course_id = O.course_id
        AND O.course_id = Re.course_id
        AND O.launch_date = Re.launch_date
        AND Re.package_id = CP.package_id
        AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
        INTO total_cp;

        IF total_cp IS NULL THEN
            total_cp := 0;
        END IF;

        --amount refunded
        SELECT SUM(Canc.refund_amt / 9)
        FROM Course_areas CA, Courses C, Offerings O, Cancels Canc
        WHERE CA.eid = r.eid
        AND CA.name = C.course_area
        AND C.course_id = O.course_id
        AND O.course_id = Canc.course_id
        AND O.launch_date = Canc.launch_date
        AND Canc.package_credit IS FALSE
        AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
        INTO total_refunded;

        IF total_refunded IS NULL THEN
            total_refunded := 0;
        END IF;

        net_fees := ROUND(total_cc + total_cp + total_refunded, 2);

        --course title that has highest total net registration fees
        OPEN refcurs FOR
        SELECT DISTINCT(C.title) AS title --rows of course_title that ended this year
        FROM Course_areas CA, Courses C, Offerings o
        WHERE CA.eid = r.eid
        AND CA.name = C.course_area
        AND C.course_id = O.course_id
        AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE);

        title_max := -2147483648;
        c_title := '';

        LOOP
            FETCH refcurs INTO r_title;
            EXIT WHEN NOT FOUND;
            --paid via credit card
            SELECT SUM(O.fees)
            FROM Course_areas CA, Courses C, Offerings O, Registers Reg
            WHERE CA.eid = r.eid
            AND CA.name = C.course_area
            AND C.title = r_title.title
            AND C.course_id = O.course_id
            AND O.course_id = Reg.course_id
            AND O.launch_date = Reg.launch_date
            AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
            INTO title_cc;

            IF title_cc IS NULL THEN
                title_cc := 0;
            END IF;

            --paid via course package
            SELECT SUM(ROUND(CP.price / CP.num_free_registrations))
            FROM Course_areas CA, Courses C, Offerings O, Redeems Re, Course_packages CP
            WHERE CA.eid = r.eid
            AND CA.name = C.course_area
            AND C.title = r_title.title
            AND C.course_id = O.course_id
            AND O.course_id = Re.course_id
            AND O.launch_date = Re.launch_date
            AND Re.package_id = CP.package_id
            AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
            INTO title_cp;

            IF title_cp IS NULL THEN
                title_cp := 0;
            END IF;

            --amount refunded
            SELECT SUM(Canc.refund_amt / 9)
            FROM Course_areas CA, Courses C, Offerings O, Cancels Canc
            WHERE CA.eid = r.eid
            AND CA.name = C.course_area
            AND C.title = r_title.title
            AND C.course_id = O.course_id
            AND O.course_id = Canc.course_id
            AND O.launch_date = Canc.launch_date
            AND Canc.package_credit IS FALSE
            AND DATE_PART('year', O.end_date) = DATE_PART('year', CURRENT_DATE)
            INTO title_refunded;

            IF title_refunded IS NULL THEN
                title_refunded := 0;
            END IF;

            title_temp := title_cc + title_cp + title_refunded;

            IF title_temp > title_max THEN
                title_max := title_temp;
                c_title := r_title.title;
            ELSIF title_temp = title_max THEN
                c_title := CONCAT(c_title, ', ', r_title.title);
            END IF;

        END LOOP;
        CLOSE refcurs;

        RETURN NEXT;

    END LOOP;
    CLOSE curs;
END
$$ LANGUAGE plpgsql;
