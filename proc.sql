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

--find_rooms
CREATE OR REPLACE FUNCTION
find_rooms(session_date DATE, start_hour TIME, session_duration INTEGER)
RETURNS TABLE(rid INT) AS $$
DECLARE
    end_hour TIME;
BEGIN
    end_hour := start_hour + session_duration;
      SELECT rid
            FROM Rooms
            EXCEPT
            SELECT C.rid
            FROM Conducts C, Sessions S
            WHERE (C.course_id = S.course_id AND C.launch_date = S.launch_date AND C.sid = S.sid)
            AND session_date = S.date
            AND ((S.start_time >= start_hour AND end_hour > S.start_time)
            OR (start_hour >= S.start_time AND S.end_time > start_hour));
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
        FROM (Registers natural join Courses natural join Offerings) A join (Sessions natural join Conducts natural join Employees) B ON A.sid = B.sid
        WHERE B.date > '2021-03-30' or (B.date = '2021-03-30' and B.end_time > '12:00')
        UNION
        SELECT DISTINCT A.number, A.title, A.fees, B.date, B.start_time, DATE_PART('hour', B.end_time - B.start_time) + DATE_PART('minute', B.end_time - B.start_time)/60.0 as duration, B.name
        FROM (Redeems natural join Courses natural join Offerings) A join (Sessions natural join Conducts natural join Employees) B on A.sid = B.sid
        WHERE B.date > '2021-03-30' or (B.date = '2021-03-30' and B.end_time > '12:00'))
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
            DELETE FROM Registers WHERE course_id = cid AND launch_date = cdate and number = cc;
            SELECT fees INTO amt FROM Offerings WHERE course_id = cid AND launch_date = cdate;
            INSERT INTO Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) VALUES (cid, cdate, session, cust, CURRENT_DATE, amt * 0.9, FALSE);
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
            DELETE FROM Redeems WHERE course_id = cid AND launch_date = cdate and number = cc;
            SELECT num_remaining_redemptions INTO remaining FROM Buys 
            WHERE date = buy_date AND package_id = package AND number = cc;
            UPDATE Buys SET num_remaining_redemptions = remaining + 1 
            WHERE date = buy_date AND package_id = package AND number = cc;
            INSERT INTO Cancels(course_id, launch_date, sid, cust_id, date, refund_amt, package_credit) VALUES (cid, cdate, session, cust, CURRENT_DATE, 0, TRUE);
        END IF;
    END IF;
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
/*
CREATE OR REPLACE FUNCTION
popular_courses()
RETURNS TABLE(course_id INTEGER, course_title TEXT, course_area TEXT, num_offerings BIGINT, registrations INTEGER) AS $$
    WITH A as (
        SELECT course_id, launch_date, start_date, title, course_area 
        FROM (Offerings NATURAL JOIN Courses) O1
        WHERE 
        --DATE_PART('year', CURRENT_DATE) = DATE_PART('year', start_date) AND 
            2 <= (SELECT COUNT(*) FROM Offerings NATURAL JOIN Courses WHERE O1.course_id = course_id)),
    B as (
        SELECT course_id, launch_date, start_date FROM Registers NATURAL JOIN Offerings 
        UNION ALL
        SELECT course_id, launch_date, start_date FROM Redeems NATURAL JOIN Offerings),
    C as (
        SELECT course_id, launch_date, start_date, count(*) as registrations
        FROM B GROUP BY course_id, launch_date, start_date),
    OfferingRegistrations as (
        SELECT * FROM A NATURAL LEFT JOIN C),
    InvalidCourses as (
        SELECT DISTINCT O1.course_id 
        FROM OfferingRegistrations O1, OfferingRegistrations O2
        WHERE O1.course_id = O2.course_id AND O1.start_date > O2.start_date AND 
            O1.registrations <= O2.registrations
    )
    SELECT DISTINCT course_id, title, course_area FROM OfferingRegistrations O
    WHERE not exists (
        SELECT 1 FROM InvalidCourses I WHERE I.course_id = O.course_id
        );
$$ LANGUAGE sql;
*/