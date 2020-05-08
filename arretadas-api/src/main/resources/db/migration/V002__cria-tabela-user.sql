create table user (
 id int not null auto_increment,
 nickname varchar(50) not null,
 protection_code varchar(6),
 password varchar(32) not null,
 
 primary key (id)
);