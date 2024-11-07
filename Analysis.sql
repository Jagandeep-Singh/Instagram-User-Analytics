-- Marketing Analysis

-- Rewarding Most Loyal Users

SYNTAX:
select * from users;
select username, created_at from  users
order by created_at limit 5;

-- Remind Inactive Users to Start Posting

SYNTAX:
select * from users, photos;  select * from users
left join photos	on  users.id=photos.user_id
where photos.image_url is null
order by users.username

-- Declaring Contest Winner

SYNTAX:
select * from likes, photos, users;
select likes.photo_id, users.id,
users.username, count(likes.user_id) as
likes from likes
inner join photos on likes.photo_id=photos.id  inner join users on photos.user_id=users.id  
group by likes.photo_id , users.username  
order by likes desc limit 3;

-- Hashtag Researching

SYNTAX:
select * from photo_tags, tags;
select tags.id, tags.tag_name,
count(photo_tags.photo_id) as  tag_count from photo_tags
inner join tags on  photo_tags.tag_id=tags.id
group by tags.tag_name
order by tag_count desc limit 5;

-- Launch AD Campaign

SYNTAX:
select * from users;
select date_format((created_at),  '%W') as days, count(username)  
from users
group by days
order by count(username) desc;

-- User Engagement

SYNTAX:
select * from photos, users;  with temp as(
    select users.id as userid, count(photos.id)
    as photoid from users
    left join photos on photos.user_id=users.id
    group by users.id
    )
select sum(photoid) as totalphotos,
count(userid) as totalusers,
sum(photoid)/count(userid) as photoperuser 
from temp;

-- Bots & Fake Accounts

SYNTAX:
select * from users, likes;  with temp as(
    select users.username,
    count(likes.photo_id) as likes from likes  inner join users on users.id=likes.user_id
    group by users.username
    )
select username, likes from temp where
likes=(select count(*) from photos)
order by username;
