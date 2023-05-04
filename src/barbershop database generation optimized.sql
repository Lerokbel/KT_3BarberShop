create schema if not exists `barbershop_database`;
 use `barbershop_database`;
 
 create table if not exists `accounts`(
 
 `id` int auto_increment not null,
 `login` varchar(50) not null unique,
 `password` varchar(50) not null,
 `role` int not null,
  constraint `PK_account` primary key (`id` ASC) 
 );
 
 create table if not exists `userInfos`(
 `id` int auto_increment not null,
 `accountId` int not null,
 `fullName` varchar(100) not null,
 `phone` varchar(15) not null,
 `status` int not null,
  constraint `PK_userInfo` primary key (`id` ASC),
  constraint `FK_userInfos_accounts` foreign key(`accountId`) references `accounts` (`id`)
 );
 
create table if not exists `mastersInfos`(
 
 `id` int auto_increment not null,
 `accountId` int not null,
 `fullName` varchar(100) not null,
 `experience` int not null,
 `status` int not null,
  constraint `PK_masters` primary key (`id` ASC),
  constraint `FK_masterInfos_accounts` foreign key(`accountId`) references `accounts` (`id`)
 );
 
 create table if not exists `purposes`(
 
 `id` int auto_increment not null,
 `name` varchar(50) not null unique,
 `cost`float not null,
  constraint `PK_purposes` primary key (`id` ASC) 
 );
 
  create table if not exists `records`(
 
 `id` int auto_increment not null,
 `purposeId` int not null,
 `clientId` int not null,
 `clearanceDateTime` datetime not null,
  constraint `PK_records` primary key (`id` ASC),
  constraint `FK_records_purposes` foreign key(`purposeId`) references `purposes` (`id`),
  constraint `FK_records_accounts` foreign key(`clientId`) references `accounts` (`id`)
 );
 
 
create table if not exists `masters_records`(
 `recordId` int not null,
 `masterId` int not null,
  constraint `FK_masters_records_records` foreign key(`recordId`) references `records` (`id`),
  constraint `FK_records_masters` foreign key(`masterId`) references `accounts` (`id`)
 );

insert into `admins` (login, password) values ('admin', 'admin');