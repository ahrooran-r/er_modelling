create database if not exists modeling_exercise;
use modeling_exercise;

# exercise 1

drop table if exists matches, players, played;

create table matches
(
    id             int auto_increment,
    date           timestamp   not null,
    stadium        varchar(30) not null,
    opponent_team  varchar(30) not null,
    own_score      decimal(2, 0) default 0,
    opponent_score decimal(2, 0) default 0,
    primary key (id)
);

create table players
(
    id   int auto_increment,
    name varchar(30),
    age  decimal(2, 0),
    primary key (id)
);

create table played
(
    player_id int not null,
    match_id  int not null,
    score     int not null,
    primary key (player_id, match_id),
    foreign key (player_id) references players (id),
    foreign key (match_id) references matches (id)
);

# exercise 2

drop table if exists customers, cars, car_accident, policy, accidents, premium_payment;

create table customers
(
    id               int auto_increment primary key,
    name             varchar(30) not null,
    postal_code      varchar(5),
    apartment_number varchar(10),
    street_name      varchar(30),
    city             varchar(30),
    district         varchar(30)
);

create table policy
(
    id int auto_increment primary key
);

create table accidents
(
    id    int auto_increment primary key,
    date  datetime    not null default now(),
    place varchar(30) not null
);

create table cars
(
    license_number varchar(30) primary key,
    model          varchar(30),
    customer_id    int not null,
    policy_id      int not null,
    foreign key (customer_id) references customers (id),
    foreign key (policy_id) references policy (id)
);

create table car_accident
(
    car_id      varchar(30),
    accident_id int,
    foreign key (car_id) references cars (license_number),
    foreign key (accident_id) references accidents (id)
);

create table premium_payment
(
    id  int auto_increment,
    policy_id   int not null,
    due_date    datetime,
    amount      decimal(7, 2),
    received_on datetime default null,
    primary key (id, policy_id),
    foreign key (policy_id) references policy (id)
);