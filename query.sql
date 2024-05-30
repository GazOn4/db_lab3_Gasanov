-- Запит №1
-- Вивести таблицю з матчами.
select * from matches;

-- Запит №2
-- Вивести гравця і матч, у якому забив більше за всіх голів.
select player.player_name, matches.match_date, match_player.goals as max_score
from player join match_player using(player_id)
	join matches using(match_id)
where match_player.goals = (select max(goals) from match_player);

-- Запит №3
-- Вивести клуби і гравців, у яких підраховано кількість днів до закінчення контракту.
-- Зробити сортування від меньшого до більшого.
select club.club_name, player.player_name, sum(contract.leave_date-contract.join_date) as days_left
from club join contract using (club_id)
	join player using(player_id)
group by club.club_name, player.player_name
order by days_left;