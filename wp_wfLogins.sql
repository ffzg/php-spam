select
	from_unixtime(ctime) as time,
	action,
	fail,
	username,
	display_name,
	user_email,
	userID,
	UA
from wp_wfLogins
join wp_users
where wp_users.ID = wp_wfLogins.userID

