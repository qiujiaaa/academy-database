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

/* ------------------------------- functionalities -------------------------------*/

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
























--update_instructor
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION 
update_instructor(cid INTEGER, l_date DATE, sess_id INTEGER, new_eid INTEGER)
RETURNS VOID AS $$
DECLARE
    instr_count INTEGER;
    conducts_count INTEGER;
    today DATE;
    curs CURSOR FOR (SELECT * FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid);
    r RECORD;
BEGIN
    SELECT COUNT(*) FROM Instructors WHERE eid = new_eid INTO instr_count;
    IF instr_count = 0 THEN
        RAISE EXCEPTION 'eid does not exists';
        RETURN;
    ELSE 
        SELECT COUNT(*) FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO conducts_count;
        IF conducts_count = 0 THEN
            RAISE EXCEPTION 'This session does not exists';
            RETURN;
        ELSE
            SELECT CURRENT_DATE INTO today;
            OPEN curs;
            FETCH curs INTO r;
            IF r.launch_date < today THEN
                RAISE EXCEPTION 'Session has already launched, cannot change instructor';
                RETURN;
            ELSE
                UPDATE Conducts SET eid = new_eid WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
            END IF;
            CLOSE curs;
        END IF;
    END IF;
END
$$ LANGUAGE plpgsql;

--update_room
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION update_room(cid INTEGER, l_date DATE sess_id INTEGER, new_rid INTEGER)
RETURNS VOID AS $$
DECLARE
    room_count INTEGER;
    conducts_count INTEGER;
    today DATE;
    curs CURSOR FOR (SELECT * FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid);
    r RECORD;
    seat_cap INTEGER;
    no_of_reg INTEGER;
BEGIN
    SELECT COUNT(*) FROM Rooms WHERE rid = new_rid into room_count;
    IF room_count = 0 THEN --Room does not exists
        RAISE EXCEPTION 'Room does not exists';
        RETURN;
    ELSE
        SELECT COUNT(*) FROM Conducts WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO conducts_count;
        IF conducts_count = 0 THEN --Session does not exists
            RAISE EXCEPTION 'This session does not exists';
            RETURN;
        ELSE
            SELECT CURRENT_DATE INTO today;
            OPEN curs;
            FETCH curs INTO r;
            IF r.launch_date < today THEN --Session alr launched
                RAISE EXCEPTION 'Session has already launched, cannot change room';
                RETURN;
            ELSE
                SELECT seating_capacity FROM Rooms WHERE rid = new_rid INTO seat_cap;
                SELECT COUNT(*) FROM Registers WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO no_of_reg;
                IF no_of_reg > seat_cap THEN --No of Reg > Seat Cap
                    RAISE EXCEPTION 'Number of registration for this session exceeds the seating capacity of new room';
                    RETURN;
                ELSE
                    UPDATE Conducts SET rid = new_rid WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
                END IF;
            END IF;
            CLOSE curs;
        END IF;
    END IF;
END             
$$ LANGUAGE plpgsql;

--remove_session
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION remove_session(cid INTEGER, l_date DATE, sess_id INTEGER)
RETURNS VOID AS $$
DECLARE
    sess_count INTEGER;
    curs CURSOR FOR (SELECT * FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid);
    r RECORD;
    today DATE;
    regist_count INTEGER;
BEGIN
    SELECT COUNT(*) FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid INTO sess_count;
    IF sess_count = 0 THEN
        RAISE EXCEPTION 'Session does not exists';
        RETURN;
    ELSE
        SELECT CURRENT_DATE INTO today;
        OPEN curs;
        FETCH curs into r;
        IF r.launch_date < today THEN
            RAISE EXCEPTION 'Session has already launched, cannot remove session';
            RETURN;
        ELSE
            SELECT COUNT(*) FROM Registers WHERE course_id = cid AND l_date = launch_date AND sid = sess_id into regist_count;
            IF regist_count > 0 THEN
                RAISE EXCEPTION 'There is at least one registration for the session';
                RETURN;
            ELSE
                DELETE FROM Sessions WHERE course_id = cid AND l_date = launch_date AND sess_id = sid;
            END IF;
        END IF;
        CLOSE curs;
    END IF;
END
$$ LANGUAGE plpgsql;

--add_session
--course offerings identifier is (course_id, launch_date)
CREATE OR REPLACE FUNCTION 
add_session(cid INTEGER, l_date DATE, new_sid INTEGER, new_date DATE, new_start TIME, instr_id INTEGER, room_id INTEGER)
RETURNS VOID AS $$
DECLARE
    today DATE;
    deadline DATE;
    offering_start DATE;
    offering_end DATE;
BEGIN
    SELECT CURRENT_DATE INTO today;
    SELECT registration_deadline FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO deadline;
    IF deadline < today THEN
        RAISE EXCEPTION 'Course offerings registration deadline passed';
        RETURN;
    ELSE
        SELECT start_date FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO offering_start;
        SELECT end_date FROM Offerings WHERE course_id = cid AND l_date = launch_date INTO offering_end;
        
        --update if new session date is earlier than offering start date
        IF offering_start > new_date THEN 
            --what will happen if new_date is earlier than resgistration date?
            UPDATE Offerings SET start_date = new_date WHERE course_id = cid AND l_date = launch_date;
        END IF;
        
        --update if new session date is later than offering end date
        IF offering_end < new_date THEN
            UPDATE Offerings SET end_date = new_date WHERE course_id = cid AND l_date = launch_date;
        END IF;
        
        --end_time is null as it is not given
        INSERT INTO Sessions(course_id, launch_date, sid, start_time, end_time, date) VALUES (cid, l_date, new_sid, new_start, null, new_date);
        INSERT INTO Conducts(course_id, launch_date, sid, rid, eid) VALUES (cid, l_date, new_sid, room_id, instr_id);
    END IF;
END
$$ LANGUAGE plpgsql;
