--sqlserver version--

create table customers (
	id		varchar(10) not null,
	firstname	varchar(32),
	lastname	varchar(32),
	gender		smallint,
	birthday	date,
	telephone	varchar(13),
	mobilephone1	varchar(13),
	mobilephone2	varchar(13),
	email		varchar(128),
	note		text,
	date_add	datetime,
	date_upd	datetime,
	primary key	(id)
);

create table complaints (
	id		varchar(10) not null,
	id_customer	varchar(10),
	description	text,
	primary key	(id),
	foreign key	(id_customer)
		references customers(id)
);

create table customer_groups (
	id		varchar(10) not null,
	id_customer	varchar(10),
	primary key	(id),
	foreign key	(id_customer)
		references customers(id)
);

create table room_types (
	id		varchar(2) not null,
	type_name	varchar(50),
	description	text,
	occupancy_max	integer,
	occupancy_adult	integer,
	occupancy_child	integer,
	price		money,
	primary key	(id)
);

create table rooms (
	id		varchar(5) not null,
	id_room_type	varchar(2),
	label		text,
	primary key	(id),
	foreign key	(id_room_type)
		references room_types(id)
);

create table room_status (
	id_room		varchar(5),
	start_date	date,
	end_date	date,
	foreign key	(id_room)
		references rooms(id),

);	

create table reservations (
	id		varchar(15) not null,
	start_date	date,
	end_date	date,
	id_customer	varchar(10),
	checkin_status	smallint,
	checkin_date	datetime,
	checkout_date	datetime,
	total_fee	money,
	primary key	(id),
	foreign key	(id_customer)
		references customers(id)	
);

create table reservation_rooms (
	id		varchar(15) not null,
	id_reservation	varchar(15),
	id_room		varchar(5),
	adults_num	integer,
	children_num	integer,
	primary key	(id),
	foreign key	(id_reservation)
		references reservations(id),
	foreign key	(id_room)
		references rooms(id)
);

create table reservation_notes (
	id_reservation	varchar(15),
	activate	smallint,
	date_add	datetime,
	date_upd	datetime,
	note		text,
	foreign key	(id_reservation)
		references reservations(id)
);


create table login (
	id		varchar(128) not null,
	id_employee	varchar(4),
	passwd		varchar(50),
	role		varchar(20),
	primary key	(id)
);

create table membership (
	id		varchar(10),
	id_customer	varchar(10),
	member_rank	char(1),
	credits		numeric(9,2),
	note		text,
	primary key	(id),
	foreign key	(id_customer)
		references customers(id)
);

create table membership_coupons (
	id		varchar(7),
	id_membership	varchar(10),	
	amount		numeric(6,2),
	is_percent	smallint,
	valid_from	datetime,
	valid_to	datetime,
	note		text
	primary key	(id),
	foreign key	(id_membership)
		references membership(id)
);

create table employees (
	id		varchar(4),
	name		varchar(50),
	job_title	varchar(30),
	mobilephone	varchar(13),
	address		text,
	primary key	(id)
);

create table report_repairs 
(
	id		varchar(7),
	id_room		varchar(5),
	id_customer	varchar(10),
	id_employee	varchar(4),
	not_room_descr	text,
	item1		text,
	item2		text,
	item3		text,
	extra_items	text,
	is_repaired	smallint,
	date_reported	datetime,
	date_repaired	datetime,
	primary key	(id),
	foreign key	(id_room)
		references rooms(id),
	foreign key	(id_customer)
		references customers(id),
	foreign key	(id_employee)
		references employees(id)
);

create table incomes (
	id		varchar(18),
	id_customer	varchar(10),
	subjects	varchar(20),
	amount		money,
	note		text,
	ref_id		varchar(50),
  _date   date,
  _time   time,
	primary key	(id),
	foreign key	(id_customer)
		references customers(id)
);

create table expences (
	id		varchar(18),
	id_employee	varchar(4),
	subjects	varchar(20),
	amount		money,
	note		text,
	invoice_id	varchar(50),
  _date   date,
  _time   time,
	primary key	(id),
	foreign key	(id_employee)
		references employees(id)
);
