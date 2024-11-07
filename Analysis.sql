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

3 - Declaring Contest Winner
SYNTAX:
select * from likes, photos, users;
