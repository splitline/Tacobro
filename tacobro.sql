CREATE TABLE IF NOT EXISTS Board (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text,
    description text
);
CREATE TABLE IF NOT EXISTS User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    picture text default 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/lg/57/thinking-face_1f914.png',
    username text,
    password text,
    first_name text,
    last_name text,
    birthday datetime,
    join_date datetime default current_timestamp,
    last_login datetime default current_timestamp,
    login_count INTEGER,
    is_admin BOOLEAN,
    is_active BOOLEAN,
    profile text,
    tacobit INTEGER default 0
);
CREATE TABLE IF NOT EXISTS Post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content text,
    publish_date datetime default current_timestamp,
    last_modify datetime default current_timestamp,
    like_count INTEGER default 0,
    dislike_count INTEGER default 0,
    author INTEGER,
    board INTEGER,
    FOREIGN KEY (author)  REFERENCES User(id),
    FOREIGN KEY (board)  REFERENCES Board(id)
);
CREATE TABLE IF NOT EXISTS Comment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author INTEGER,
    post INTEGER,
    last_modify datetime default current_timestamp,
    publish_date datetime default current_timestamp,
    content text,
    FOREIGN KEY (author)  REFERENCES User(id),
    FOREIGN KEY (post)  REFERENCES Post(id)
);
CREATE TABLE IF NOT EXISTS Following (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_no INTEGER,
    following_no INTEGER,
    FOREIGN KEY (user_no)  REFERENCES User(id),
    FOREIGN KEY (following_no)  REFERENCES User(id)
);
CREATE TABLE Friendship (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_A INTEGER,
    user_B INTEGER,
    strength INTEGER default 0,
    FOREIGN KEY (user_A)  REFERENCES User(id),
    FOREIGN KEY (user_B)  REFERENCES User(id)
);
CREATE TABLE IF NOT EXISTS Bucket_list (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    board_no INTEGER,
    user_no INTEGER,
    FOREIGN KEY (board_no)  REFERENCES Board(id),
    FOREIGN KEY (user_no)  REFERENCES User(id)
);
CREATE TABLE IF NOT EXISTS Who_likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_no INTEGER,
    like_no INTEGER,
    FOREIGN KEY (user_no)  REFERENCES User(id),
    FOREIGN KEY (like_no)  REFERENCES User(id)
);
CREATE TABLE IF NOT EXISTS Who_dislikes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_no INTEGER,
    dislike_no INTEGER,
    FOREIGN KEY (user_no)  REFERENCES User(id),
    FOREIGN KEY (dislike_no)  REFERENCES User(id)
);
CREATE TABLE IF NOT EXISTS AdBoard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position text,
    width INTEGER default 0,
    height INTEGER default 0,
    price INTEGER default 0
);
CREATE TABLE IF NOT EXISTS Ad (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ad text,
    URL text,
    start_date datetime,
    end_date datetime,
    poster INTEGER,
    board INTEGER,
    FOREIGN KEY (poster)  REFERENCES User(id),
    FOREIGN KEY (board)  REFERENCES AdBoard(id)
);

CREATE TABLE IF NOT EXISTS Notifications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    notified_date datetime default current_timestamp,
    link text,
    content text,
    has_read BOOLEAN default 0,
    user INTEGER,
    FOREIGN KEY (user) REFERENCES User(id)
);

insert into Board (name, description) values ('C_Chat', '姆咪');
insert into Board (name, description) values ('Sex', 'ii');
insert into Board (name, description) values ('Tobacco', '雲端抽煙');

insert into AdBoard (position, price) values ('left', 128);
insert into AdBoard (position, price) values ('middle', 256);
insert into AdBoard (position, price) values ('right', 512);

insert into User (picture,username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values (
    'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/155/smiling-face-with-smiling-eyes-and-three-hearts_1f970.png','mango', '3345678', '姆咪', '陳', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, "並沒有");
insert into User (picture, username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values (
    'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/mozilla/36/smiling-face-with-smiling-eyes_1f60a.png', 'splitline', '949487', '星爆', '李', '2008-01-01 10:00:00', '2008-01-01 10:00:00', '2008-01-01 10:00:00', 0, 0, 1, "我的名字不好唸 叫做康帕內魯拉");
insert into User (picture, username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values (
    'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/emojione/151/smiling-face-with-smiling-eyes-and-three-hearts_1f970.png', 'Nanoda', 'japari', 'noda', 'Na', '2008-01-01 10:00:00', '2008-01-01 10:00:00', '2008-01-01 10:00:00', 1, 1, 1,"平成最後的nanoda");
insert into User (picture,tacobit,username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values (
    'https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5_400x400.jpeg',10000,'hank5566', '2e8db3aceb4b0eb09d42bd545be707ece82981a09e728aa4616d4bdd0e3e11cc', 'Hank', 'Lu', '2008-01-01 10:00:00', '2008-01-01 10:00:00', '2008-01-01 10:00:00', 1, 1, 1,"喵喵叫每一天");
insert into User (picture,tacobit,username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values (
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffpKD__eKLPR2piV-j1g7jochChQ2geX1KU63RDDgT1A1p3v6',10000,'mumi5566', '2e8db3aceb4b0eb09d42bd545be707ece82981a09e728aa4616d4bdd0e3e11cc', '姆咪騎士', 'Lu', '2008-01-01 10:00:00', '2008-01-01 10:00:00', '2008-01-01 10:00:00', 1, 1, 1,"我自己改就好");


insert into Post (content, author, board, like_count, dislike_count) values (
    '我喜歡喵喵', 4, 1, 1024, 16
);
insert into Post (content, author, board, like_count, dislike_count) values (
    '我不喜歡喵喵', 4, 1, 16, 1024
);

insert into Post (content, author, board, like_count, dislike_count) values ('艾喵喵', 2, 2, 11, 3);
insert into Post (content, author, board, like_count, dislike_count) values ('討厭喵喵', 2, 2, 12, 3);

insert into Comment (author, post, content) values (
    1, 1, 'ouo!!!'
);

insert into Comment (author, post, content) values (
    2, 1, 'qwq!!!'
);


insert into Following(user_no, following_no) values (4, 1);
insert into Following(user_no, following_no) values (4, 2);

insert into Following(user_no, following_no) values (2,4);
insert into Following(user_no, following_no) values (3,4);


insert into User (picture,username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values ('https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/emojione/151/thinking-face_1f914.png','apple1', '123456', 'apple', '1', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, 'apple1');
insert into User (username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values ('apple2', '123456', 'apple', '2', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, 'apple2');
insert into User (username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values ('apple3', '123456', 'apple', '3', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, 'apple3');
insert into User (username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values ('apple4', '123456', 'apple', '4', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, 'apple4');
insert into User (picture,username, password, first_name, last_name, birthday, join_date, last_login, login_count, is_admin, is_active, profile) values ('https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/samsung/148/face-with-stuck-out-tongue_1f61b.png','apple5', '123456', 'apple', '5', '2007-01-01 10:00:00', '2007-01-01 10:00:00', '2007-01-01 10:00:00', 0, 0, 1, 'apple5');

insert into Friendship(user_A, user_B, strength) values (4,2,222);
insert into Friendship(user_A, user_B, strength) values (4,3,40);
insert into Friendship(user_A, user_B, strength) values (4,1,170);
insert into Friendship(user_A, user_B, strength) values (4,5,5);
insert into Friendship(user_A, user_B, strength) values (4,9,120);
