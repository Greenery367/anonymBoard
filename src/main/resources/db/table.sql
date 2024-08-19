Create database myBoard;
use myBoard;


create table board_tb (
	id int primary key not null auto_increment,
    title varchar(50) not null,
    content text not null,
    author varchar(20),
    status int not null default 1,
    password int not null,
    created_at timestamp default now()
)