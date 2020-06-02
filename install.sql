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

create table date_range (
	id		varchar(20) not null,
	time_start	date,
	time_end	date,
	primary key	(id)
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
	id_date_range	varchar(20),
	foreign key	(id_room)
		references rooms(id),
	foreign key	(id_date_range)
		references date_range(id)
);	

create table reservations (
	id		varchar(15) not null,
	id_date_range	varchar(20),
	id_customer	varchar(10),
	checkin_status	smallint,
	checkin_date	datetime,
	checkout_date	datetime,
	primary key	(id),
	foreign key	(id_date_range)
		references date_range(id),
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
	foriegn key	(id_room)
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
	id		varchar(20) not null,
	passwd		varchar(50),
	role		varchar(20),
	primary key	(id)
);
